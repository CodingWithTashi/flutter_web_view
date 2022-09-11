import Foundation
import Flutter
import UIKit
class FlutterWebView: NSObject, FlutterPlatformView {
    private var _nativeWebView: UIWebView
    private var _methodChannel: FlutterMethodChannel
    
    func view() -> UIView {
        return _nativeWebView
    }
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger
    ) {
        _nativeWebView = UIWebView()
        _methodChannel = FlutterMethodChannel(name: "plugins.codingwithtashi/flutter_web_view_\(viewId)", binaryMessenger: messenger)

        super.init()
        // iOS views can be created here
        _methodChannel.setMethodCallHandler(onMethodCall)

    }


    func onMethodCall(call: FlutterMethodCall, result: FlutterResult) {
        switch(call.method){
        case "setUrl":
            setText(call:call, result:result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    func setText(call: FlutterMethodCall, result: FlutterResult){
        let url = call.arguments as! String
        _nativeWebView.loadRequest(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
    }
    
}
