//
//  StockHttpHandler.swift
//  StockPackageDescription
//
//  Created by Masatsugu Oomiya on 2017/10/26.
//

import PerfectHTTP

public struct StockHttpHandler {
  public static func staticFiles(data: [String:Any]) throws -> RequestHandler {
    let documentRoot = data["documentRoot"] as? String ?? "./public"
    let allowResponseFilters = data["allowResponseFilters"] as? Bool ?? false
    return {
      req, resp in
      StockStaticFileHandler(documentRoot: documentRoot, allowResponseFilters: allowResponseFilters)
        .handleRequest(request: req, response: resp)
    }
  }
}
