import Vapor
import Jay
import HTTP
#if os(Linux)
    import Duktape
#else
    import JavaScriptCore
#endif

let jsFile = "Resources/server.js"

extension Droplet {
    
    ////////////////////////////////////////////////////////////////////////////////
    // Linux
    ////////////////////////////////////////////////////////////////////////////////
    
#if os(Linux)
    
    func render(state: [String: Any]) -> (html: String, state: String)? {
        let stateJSON = toJSON(value: state)
        let ctx = duk_create_heap(nil, nil, nil, nil, nil)
        defer { duk_destroy_heap(ctx) }
        duk_eval_file_noresult(ctx, jsFile)
        duk_push_global_object(ctx)
        duk_get_prop_string(ctx, -1, "server")
        duk_get_prop_string(ctx, -1, "render")
        duk_push_string(ctx, stateJSON)
        duk_json_decode(ctx, -1)
        let ret = duk_safe_call(ctx, { ctx in duk_call(ctx, 1); return 1; }, 1, 1);
        if ret != DUK_EXEC_SUCCESS {
            let errorMessage = String(validatingUTF8: duk_safe_to_string(ctx, -1))!
            print("Error calling render(): \(errorMessage)")
            duk_pop(ctx)
            return nil
        } else {
            duk_json_encode(ctx, -1)
            let resultJSON = String(validatingUTF8: duk_to_string(ctx, -1))!
            duk_pop(ctx)
            if let result = try? Jay().anyJsonFromData(Array(resultJSON.utf8)) as! [String: Any] {
                return (
                    html: result["html"]! as! String,
                    state: result["state"]! as! String
                )
            }
        }
        return nil
    }
    
#else
    
    ////////////////////////////////////////////////////////////////////////////////
    // OS X
    ////////////////////////////////////////////////////////////////////////////////
    
    /* Helper to load the JavaScript server code */
    func loadJS() -> JSValue? {
        let context = JSContext()
        context?.exceptionHandler = { context, exception in
            print("JS Error: \(exception?.toString() as String?)")
        }
        do {
            let js = try String(contentsOfFile: jsFile, encoding: String.Encoding.utf8)
            _ = context?.evaluateScript(js)
        }
        catch (let error) {
            print("Error while processing script file: \(error)")
            return nil
        }
        return context?.objectForKeyedSubscript("server")
    }
    
    /* Helper to call the JavaScript render() function */
    func render(state: [String: Any]) -> (html: String, state: String)? {
        if let result = loadJS()?.forProperty("render")?
            .call(withArguments: [state]).toDictionary() {
            return (
                html: result["html"]! as! String,
                state: result["state"]! as! String
            )
        }
        return nil
    }
    
#endif
    
    func toJSON(value: Any) -> String {
        let data = try! Jay().dataFromJson(any: value)
        return String(bytes: data, encoding: String.Encoding.utf8)!
    }
    
    enum ServerSideRenderingError : Error {
        case cannotConvertToArray
    }
    
    func bytesToArray(data: Bytes) throws -> [Any] {
        let object = try Jay().anyJsonFromData(data)
        if let array = object as? [Any] {
            return array
        }
        throw ServerSideRenderingError.cannotConvertToArray
    }

    func setupRoutes() throws {
        get("/") { req in
            let gitCommitHash = self.config["app", "gitCommitHash"]?.string ?? "unknown"
            if req.headers["X-DevServer"] != nil {
                // When accessing through the dev server, don't prerender anything
                return try self.view.make("index", [
                    "html": "",
                    "state": "undefined",
                    "gitCommitHash": gitCommitHash
                    ])
            } else {
                // Prerender state from the DB
                let tasks = try! Task.all().makeJSON() // TODO : exception handling
                let taskArray = try! self.bytesToArray(data:tasks.makeJSON().makeBytes()) // TODO : exception handling
                let state: [String : Any] = [
                    "tasks": taskArray
                ]
                if let result = self.render(state: state) {
                    return try self.view.make("index", [
                        "html": Node.string(result.html),
                        "state": Node.string(result.state),
                        "gitCommitHash": gitCommitHash
                        ])
                } else {
                    let json = self.toJSON(value: state).replacingOccurrences(of: "'", with: "'\\''")
                    print("To get more information, run:")
                    print("  ./renderComponent '\(json)'")
                }
                throw Abort.badRequest
            }
        }
        try resource("api/todo/tasks", TodoTasksApi.self)
    }
}
