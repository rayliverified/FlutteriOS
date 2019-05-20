//
//  ViewController.swift
//  FlutterDemo
//
//  Created by Christopher Lam on 5/14/19.
//  Copyright © 2019 nocd. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    var flutterView: FlutterViewController
    var flutterChannel: FlutterMethodChannel
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        flutterView = FlutterViewController(nibName: nil, bundle: nil);
        flutterChannel = FlutterMethodChannel(name: "app", binaryMessenger: flutterView)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        flutterView = FlutterViewController(nibName: nil, bundle: nil);
        flutterChannel = FlutterMethodChannel(name: "app", binaryMessenger: flutterView)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        button.setTitle("Press me", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        let button2 = UIButton(type:UIButton.ButtonType.custom)
        button2.addTarget(self, action: #selector(handleButtonAction2), for: .touchUpInside)
        button2.setTitle("Page Main", for: UIControl.State.normal)
        button2.frame = CGRect(x: 80.0, y: 260.0, width: 160.0, height: 40.0)
        button2.backgroundColor = UIColor.red
        self.view.addSubview(button2)
        let button3 = UIButton(type:UIButton.ButtonType.custom)
        button3.addTarget(self, action: #selector(handleButtonAction2), for: .touchUpInside)
        button3.setTitle("Page Transparent", for: UIControl.State.normal)
        button3.frame = CGRect(x: 80.0, y: 310.0, width: 160.0, height: 40.0)
        button3.backgroundColor = UIColor.red
        self.view.addSubview(button3)
        
        flutterView.setInitialRoute("page_main")
        flutterView.isViewOpaque = false
        flutterView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        flutterChannel.setMethodCallHandler {
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch (call.method) {
            case "navigation":
                switch(call.arguments as! String) {
                case "back":
                    self.flutterView.dismiss(animated: true, completion: nil)
                default:
                    return
                }
                result("Hello, \(call.arguments as! String)")
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
        let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine;
        flutterEngine?.run(withEntrypoint: nil);
    }
    
    @objc func handleButtonAction() {
        self.present(flutterView, animated: false, completion: nil)
    }
    
    @objc func handleButtonAction2() {
        flutterChannel.invokeMethod("page", arguments: "page_main") {
            (result: Any?) -> Void in
            if let error = result as? FlutterError {
                print("%@ failed: %@" + error.message!)
            } else if FlutterMethodNotImplemented.isEqual(result) {
                print("%@ not implemented")
            } else {
                print("%@")
            }
        }
    }
    
    @objc func handleButtonAction3() {
        flutterChannel.invokeMethod("page", arguments: "page_transparent") {
            (result: Any?) -> Void in
            if let error = result as? FlutterError {
                print("%@ failed: %@" + error.message!)
            } else if FlutterMethodNotImplemented.isEqual(result) {
                print("%@ not implemented")
            } else {
                print("%@")
            }
        }
    }
}
