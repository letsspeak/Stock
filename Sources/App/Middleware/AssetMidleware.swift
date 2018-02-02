import Foundation
import HTTP
import libc

/// Servers files from the supplied public directory
/// on not found errors.
public final class AssetMiddleware: Middleware {
    
    private var assetDirs: [String]
    private var publicDir: String
    
    private let loader = DataFile()
    private let chunkSize: Int
    
    public init(assetDirs: [String], publicDir: String, chunkSize: Int? = nil) {
        // Remove last "/" from the publicDir if present, so we can directly append uri path from the request.
        self.assetDirs = assetDirs
        self.publicDir = publicDir.finished(with: "/")
        self.chunkSize = chunkSize ?? 32_768 // 2^15
    }

    public func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        var path = request.uri.path
        guard !path.contains("../") else {
            throw HTTP.Status.forbidden
        }
        if path.hasPrefix("/") {
            path = String(path.dropFirst())
        }
        if assetDirs.index(where: { path.starts(with: $0) }) != nil {
            let filePath = publicDir + path
            let ifNoneMatch = request.headers["If-None-Match"]
            return try Response(filePath: filePath, ifNoneMatch: ifNoneMatch, chunkSize: chunkSize)
        }
        return try next.respond(to: request)
    }
}

