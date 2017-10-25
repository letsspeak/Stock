//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//  Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMySQL

func handler(data: [String:Any]) throws -> RequestHandler {
  return {
    request, response in
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>Stock</title><body><h1>Welcome to Stock!</h1></body></html>")
    response.completed()
  }
}

func mysqlTest() {
  let host = "127.0.0.1"
  let user = "pochinki"
  let password = "pochinki"
  let db = "pochinki"
  
  let mysql = MySQL()
  let connected = mysql.connect(host: host, user: user, password: password, db: db)
  guard connected else {
    print(mysql.errorMessage())
    return
  }
  defer {
    mysql.close()
  }
  
  guard mysql.setOption(.MYSQL_SET_CHARSET_NAME, "utf8"),
    mysql.query(statement: "SELECT * FROM users"),
    let results = mysql.storeResults() else {
      return
  }
  
  results.forEachRow(callback: { row in
    row.forEach({ (element) in
      if let element = element {
        print(element)
      } else {
        print("row element is nil")
      }
    })
  })
}

// Configuration data for an example server.
// This example configuration shows how to launch a server
// using a configuration dictionary.


let confData = [
  "servers": [
    // Configuration data for one server which:
    //  * Serves the hello world message at <host>:<port>/
    //  * Serves static files out of the "./webroot"
    //    directory (which must be located in the current working directory).
    //  * Performs content compression on outgoing data when appropriate.
    [
      "name":"localhost",
      "port":8080,
      "routes":[
        ["method":"get", "uri":"/", "handler": handler],
        ["method":"get", "uri":"/**", "handler": PerfectHTTPServer.HTTPHandler.staticFiles,
         "documentRoot":"./webroot",
         "allowResponseFilters":true]
      ],
      "filters":[
        [
          "type":"response",
          "priority":"high",
          "name":PerfectHTTPServer.HTTPFilter.contentCompression,
          ]
      ]
    ]
  ]
]

do {
  // Launch the servers based on the configuration data.
  try HTTPServer.launch(configurationData: confData)
} catch {
  fatalError("\(error)") // fatal error launching one of the servers
}

