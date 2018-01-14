//
//  TodoApi.swift
//  StockPackageDescription
//
//  Created by letsspeak on 2018/01/14.
//

import Vapor
import HTTP

final class TodoApi: ResourceRepresentable {
    func new(_ request: Request) throws -> ResponseRepresentable {
        let todo = try request.toTodo()
//        try todo.save()
        return todo
    }
    
    func makeResource() -> Resource<Todo> {
        return Resource(
            index: nil,
            store: new,
            show: nil,
            update: nil,
            replace: nil,
            destroy: nil,
            clear: nil
        )
    }
}

extension Request {
    func toTodo() throws -> Todo {
        guard let json = json else { throw Abort.badRequest }
        return try Todo(json: json)
    }
}

extension TodoApi: EmptyInitializable { }
