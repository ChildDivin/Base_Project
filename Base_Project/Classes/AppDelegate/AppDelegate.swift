//
//  AppDelegate.swift
//  Base_Project
//
//  Created by Tops on 9/16/16.
//  Copyright © 2016 Self. All rights reserved.
//

import UIKit
import MBProgressHUD


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {
       
    }

    func applicationDidBecomeActive(application: UIApplication) {
    
    }

    func applicationWillTerminate(application: UIApplication) {
      
    }

    // MARK: - Loader Start/Stop Methods
    func startSpinerWithOverlay (overlay: Bool) {
        self.stopSpiner()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        MBProgressHUD.showHUDAddedTo(appDelegate.window, animated: true)
        
    }
    func stopSpiner() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        MBProgressHUD.hideAllHUDsForView(appDelegate.window, animated: true)
    }

}

