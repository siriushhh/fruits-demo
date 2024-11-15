//
//  AppDelegate.swift
//  demo-test
//
//  Created by hxy on 2024/11/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootViewController = RootViewController()
        rootViewController.navigationBar.isHidden = true

        //TODO: check
        var controllers: [UIViewController] = rootViewController.viewControllers

        let launchView = UINib(nibName: "LaunchScreen", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView

        launchView.frame = UIScreen.main.bounds
        launchView.isHidden = false
        rootViewController.view.addSubview(launchView)
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        let homeViewController = MainPage()
        controllers.append(homeViewController)
        rootViewController.setViewControllers(controllers, animated: true)
        launchView.removeFromSuperview()

        return true
    }
    

}



