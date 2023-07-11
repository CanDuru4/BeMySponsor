//
//  AuthViewController.swift
//  SponsorApp
//
//  Created by Can Duru on 14.11.2022.
//

import UIKit

class AuthViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Create Navigation Controllers
        self.viewControllers = [LogInViewController()]
        
    }
}
