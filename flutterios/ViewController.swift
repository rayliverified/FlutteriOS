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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(handleButtonAction), for: .touchUpInside)
        button.setTitle("Press me", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
    }
    
    @objc func handleButtonAction() {
        let flutterViewController = FlutterViewController(nibName: nil, bundle: nil);
        flutterViewController.isViewOpaque = false
        flutterViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext

        let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine;
        flutterEngine?.run(withEntrypoint: nil);
        self.present(flutterViewController, animated: false, completion: nil)
    }
}
