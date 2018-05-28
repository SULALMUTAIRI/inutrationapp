//
//  MainUITabBarController.swift
//  inutrationapp
//
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit

class MainUITabBarController : UITabBarController
{
    
    override func viewDidAppear(_ animated: Bool) {
        let isLogged = UserDefaults.standard.bool(forKey: "isLogin")
        if isLogged == true {
            
        }
        else {
            self.performSegue(withIdentifier: "loginView",sender: self)
        }
    }
}
