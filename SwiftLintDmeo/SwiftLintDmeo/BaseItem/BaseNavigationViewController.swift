//
//  BaseNavigationViewController.swift
//  SwiftLintDmeo
//
//  Created by chuangchuang wang on 2018/1/30.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    enum CustomBarStyle {
        case `default`
        case light
    }

    var barStyle: CustomBarStyle = .default {
        didSet {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if self.barStyle == .default {
            return .default
        } else {
            return .lightContent
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let font = UIFont(name: "normalFontIdentifier", size: 15) {
            self.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.black,
                .font: font
            ]
        }
        self.navigationBar.isTranslucent = false
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)

        if self.viewControllers.count > 1 {
            let backButton = UIButton(type: .custom)
            let backArrowImage = UIImage(named: "back-meta-small", in: nil, compatibleWith: nil)
            backButton.setImage(backArrowImage, for: .normal)
            backButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            backButton.addTarget(self, action: #selector(tapBack(sender:)), for: .touchUpInside)
            let leftBarButtonItem = UIBarButtonItem(customView: backButton)
            viewController.navigationItem.leftBarButtonItem = leftBarButtonItem

        } else {
            let nilBackBarButtonItem = UIBarButtonItem(customView: UIView())
            viewController.navigationItem.leftBarButtonItem = nilBackBarButtonItem
        }
    }

    @objc
    func tapBack(sender: UIButton) {
        self.popViewController(animated: true)
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
