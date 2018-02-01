//
//  GlobalConstants.swift
//  SwiftLintDmeo
//
//  Created by chuangchuang wang on 2018/1/30.
//  Copyright © 2018年 chuangchuang wang. All rights reserved.
//
import Foundation
import UIKit

let audiNormalFontIdentifier = "Audi-Extended-Bold"
let audiExtendFontIdentifier = "Audi-Screen-Normal"
let normalFontIdentifier = "Asap-Regular"
let extendFontIdentifier = "Asap-SemiBold"

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

let isIPhoneX = ScreenHeight == 812.0 ? true : false
let OTNavigationBarHeight: CGFloat = isIPhoneX ? 88 : 64
let OTTabBarHeight: CGFloat = isIPhoneX ? 83 : 49
let OTStatusBarHeight: CGFloat = isIPhoneX ? 44 : 20

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
