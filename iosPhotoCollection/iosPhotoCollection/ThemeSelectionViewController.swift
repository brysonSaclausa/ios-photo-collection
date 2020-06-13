//
//  ThemeSelectionViewController.swift
//  iosPhotoCollection
//
//  Created by B$hady on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectLightTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
    }
    
    func setTheme() {
        guard let currentTheme = themeHelper?.themePreference else { return }
             if currentTheme == "Dark" {
                 view.backgroundColor = UIColor(named: "Dark")
             } else {
              view.backgroundColor = UIColor(named: "Light2")
             }
         
         }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
        
    

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        themeHelper?.setTheme(viewController: self)

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
