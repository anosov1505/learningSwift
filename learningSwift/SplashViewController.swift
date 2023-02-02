//
//  SplashScreen.swift
//  learningSwift
//
//  Created by Артем Аносов on 05.01.2023.
//

import UIKit
class SplashViewController: UIViewController {
    private let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    private let someImage: UIImageView = {
        let splashImage = UIImageView()
        splashImage.image = UIImage(named: "splash1.jpeg")
        splashImage.translatesAutoresizingMaskIntoConstraints = false
        return splashImage
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 31/255, green: 1/255, blue: 35/255, alpha: 1)
        view.addSubview(someImage)
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            someImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            someImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            someImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            someImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            

        ])
        makeServiceCall()
    }
    
   private func makeServiceCall() {
       activityIndicator.startAnimating()
       DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
           self.activityIndicator.stopAnimating()
           if UserDefaults.standard.bool(forKey: "LOGGED_IN") {
                       // navigate to protected page
               AppDelegate.shared.rootViewController.switchToMainScreen()
           } else {
                       // navigate to login screen
               AppDelegate.shared.rootViewController.switchToLogout()
           }
       }
   }

}
    
