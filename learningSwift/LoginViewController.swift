//
//  LoginViewController.swift
//  learningSwift
//
//  Created by Артем Аносов on 11.01.2023.
//

import UIKit
class LoginViewController: UIViewController {
   override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = UIColor(red: 31/255, green: 1/255, blue: 35/255, alpha: 1)
       let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
       navBar.backgroundColor = .white
       view.addSubview(navBar)
       title = "Welcome"
       let loginButton = UIBarButtonItem(title: "Log In", style: .plain, target: self, action: #selector(login))
       navigationItem.setLeftBarButton(loginButton, animated: true)
   }
@objc
   private func login() {
      // store the user session (example only, not for the production)
       UserDefaults.standard.set(true, forKey: "LOGGED_IN")
      // navigate to the Main Screen
       AppDelegate.shared.rootViewController.switchToMainScreen()
   }
}
