import Vapor
import FluentProvider
import HTTP

final class Task: Model, Timestampable {
    let storage = Storage()
    
    var title: String
    var completed: Bool
    
    struct Keys {
        static let id = "id"
        static let title = "title"
        static let completed = "completed"
    }

    init(title: String, completed: Bool) {
        self.title = title
        self.completed = completed
    }

    // MARK: Fluent Serialization

    init(row: Row) throws {
        self.title = try row.get(Task.Keys.title)
        self.completed = try row.get(Task.Keys.completed)
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Task.Keys.title, title)
        try row.set(Task.Keys.completed, completed)
        return row
    }
}

// MARK: Fluent Preparation

extension Task: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { tasks in
            tasks.id()
            tasks.string(Task.Keys.title)
            tasks.bool(Task.Keys.completed)
        }
    }
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension Task: JSONConvertible {
    convenience init(json: JSON) throws {
        self.init(
            title: try json.get(Task.Keys.title),
            completed: try json.get(Task.Keys.completed)
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Task.Keys.id, id)
        try json.set(Task.Keys.title, title)
        try json.set(Task.Keys.completed, completed)
        return json
    }
}

extension Task: ResponseRepresentable { }

extension Task: Updateable {
    public static var updateableKeys: [UpdateableKey<Task>] {
        return [
            UpdateableKey(Task.Keys.title, String.self) { task, title in
                task.title = title
            },
            UpdateableKey(Task.Keys.completed, Bool.self) { task, completed in
                task.completed = completed
            }
        ]
    }
}
