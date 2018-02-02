import App
import XFPMiddleware

/// We have isolated all of our App's logic into
/// the App module because it makes our app
/// more testable.
///
/// In general, the executable portion of our App
/// shouldn't include much more code than is presented
/// here.
///
/// We simply initialize our Droplet, optionally
/// passing in values if necessary
/// Then, we pass it to our App's setup function
/// this should setup all the routes and special
/// features of our app
///
/// .run() runs the Droplet's commands, 
/// if no command is given, it will default to "serve"
let config = try Config()
try config.setup()

let xfpMiddleware = XFPMiddleware()
config.addConfigurable(middleware: xfpMiddleware, name: "xfp-middleware")

let assetDirs = [
    "js/",
    "images/",
]

let assetMiddleware = AssetMiddleware(assetDirs: assetDirs, publicDir: config.publicDir)
config.addConfigurable(middleware: assetMiddleware, name: "asset-middleware")

let drop = try Droplet(config)
try drop.setup()

try drop.run()
