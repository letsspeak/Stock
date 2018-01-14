//
//  TodoTaskApi.swift
//  StockPackageDescription
//
//  Created by letsspeak on 2018/01/14.
//

import Vapor
import HTTP

final class TodoTasksApi: ResourceRepresentable {
    
    func index(_ req: Request) throws -> ResponseRepresentable {
        return try Task.all().makeJSON()
    }

    func store(_ request: Request) throws -> ResponseRepresentable {
        let task = try request.toTask()
        try task.save()
        return task
    }
    
    func makeResource() -> Resource<Task> {
        return Resource(
            index: index,
            store: store,
            show: nil,
            update: nil,
            replace: nil,
            destroy: nil,
            clear: nil
        )
    }
}

extension Request {
    func toTask() throws -> Task {
        guard let json = json else { throw Abort.badRequest }
        return try Task(json: json)
    }
}

extension TodoTasksApi: EmptyInitializable { }
