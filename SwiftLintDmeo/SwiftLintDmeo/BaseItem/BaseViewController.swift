//
//  BaseViewController.swift
//  SwiftLintDmeo
//
//  Created by chuangchuang wang on 2018/1/30.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {

    enum CustomBarStyle {
        case `default`
        case light
    }

    var barStyle: CustomBarStyle = .default {
        didSet {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.2
        if let rect = self.navigationController?.navigationBar.bounds {
            self.navigationController?.navigationBar.layer.shadowPath = UIBezierPath(rect: rect).cgPath
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 全屏右滑返回手势
        /*let target = navigationController?.interactivePopGestureRecognizer?.delegate
         let panGesture = UIPanGestureRecognizer(target: target, action: #selector(handleNavigationTransition(_:)))
         panGesture.delegate = self
         view.addGestureRecognizer(panGesture)
         navigationController?.interactivePopGestureRecognizer?.isEnabled = false*/

        //系统右滑返回手势
        navigationController?.interactivePopGestureRecognizer?.delegate = self

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if self.barStyle == .default {
            return .default
        } else {
            return .lightContent
        }
    }

    func handleNavigationTransition(_ sender: UIPanGestureRecognizer) {

    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if navigationController?.childViewControllers.count == 1 {
            return false
        } else {
            return true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
/*
 extension BaseViewController: NotificationButtonPressedProtocol {
 func bottomButtonHasBeenPressed() {}
 }
 
 extension BaseViewController: NotificationCancelPressedProtocol {
 func cancelHasbeenPressed() {}
 }
 */
