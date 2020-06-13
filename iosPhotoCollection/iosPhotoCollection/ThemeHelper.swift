//
//  ThemeHelper.swift
//  iosPhotoCollection
//
//  Created by B$hady on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

import UIKit


class ThemeHelper {
    
    var themePreference: String? {
        guard let usersPreference = UserDefaults.standard.string(forKey: .themePreferenceKey) else { return "Dark"}
        return usersPreference
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: .themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light2", forKey: .themePreferenceKey)
    }
    
    func setTheme(viewController: UIViewController) {
        if let userTheme = themePreference {
            if userTheme == "Dark" {
                viewController.view.backgroundColor = UIColor(named: "Dark")
               } else {
                viewController.view.backgroundColor = UIColor(named: "Light2")
            }
        }
   }
    
    init() {
        
        if UserDefaults.standard.string(forKey: .themePreferenceKey) == nil {
            setThemePreferenceToDark()
        }
        
    }
    
}
    
extension String {
    static var themePreferenceKey = "themePreference"
}
    
    
