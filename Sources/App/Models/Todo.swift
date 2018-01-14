import Vapor
import FluentProvider
import HTTP

final class Todo: Model {
    let storage = Storage()
    
    var title: String
    struct Keys {
        static let id = "id"
        static let title = "title"
    }

    init(title: String) {
        self.title = title
    }

    // MARK: Fluent Serialization

    init(row: Row) throws {
        title = try row.get(Todo.Keys.title)
    }

    // Serializes the Post to the database
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Todo.Keys.title, title)
        return row
    }
}

// MARK: Fluent Preparation

extension Todo: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string(Todo.Keys.title)
        }
    }
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension Todo: JSONConvertible {
    convenience init(json: JSON) throws {
        self.init(
            title: try json.get(Todo.Keys.title)
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Todo.Keys.id, id)
        try json.set(Todo.Keys.title, title)
        return json
    }
}

extension Todo: ResponseRepresentable { }

extension Todo: Updateable {
    public static var updateableKeys: [UpdateableKey<Todo>] {
        return [
            UpdateableKey(Todo.Keys.title, String.self) { todo, title in
                todo.title = title
            }
        ]
    }
}
