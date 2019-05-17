//
//  AppDelegate.swift
//  FlutterDemo
//
//  Created by Christopher Lam on 5/14/19.
//  Copyright © 2019 nocd. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant // Only if you have Flutter Plugins.

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    var flutterEngine : FlutterEngine?
    // Only if you have Flutter plugins.
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.flutterEngine = FlutterEngine(name: "io.flutter", project: nil);
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }
}
