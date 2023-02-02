//
//  ViewController.swift
//  learningSwift
//
//  Created by Артем Аносов on 20.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let headLabel : UILabel = {
        let label = UILabel()
        label.text = "Онлайн-кинотеатр Иви"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subLabel : UILabel = {
        let label = UILabel()
        label.text = "Мы - крупнейший в России олнайн-кинотеатр, работающий на рынке легального профессионального видеоконтента. Наша миссия - открывать для людей мир кино во всём его многообразии"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let someImage: UIImageView = {
        let headImage = UIImageView()
        headImage.image = UIImage(named: "ivi1.png")
        headImage.translatesAutoresizingMaskIntoConstraints = false
        return headImage
    }()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: 31/255, green: 1/255, blue: 35/255, alpha: 1)
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        navBar.backgroundColor = .white
        view.addSubview(navBar)
        title = "Main Page"
        let logoutButton = UIBarButtonItem(title: "log out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
        let toTableButton = UIBarButtonItem(title: "Countries table", style: .plain, target: self, action: #selector(toTable))
        navigationItem.setRightBarButton(toTableButton, animated: true)
        setupSubviews()
        
    }
    @objc
       private func logout() {
          // clear the user session (example only, not for the production)
           UserDefaults.standard.set(false, forKey: "LOGGED_IN")
          // navigate to the Main Screen
           AppDelegate.shared.rootViewController.switchToLogout()
       }
    @objc
        private func toTable() {
        AppDelegate.shared.rootViewController.switchToTable()
        }
    private func setupSubviews() {
        view.addSubview(headLabel)
        view.addSubview(subLabel)
        view.addSubview(someImage)
           
           /// Constraints
           let margins = view.layoutMarginsGuide
           NSLayoutConstraint.activate([
               headLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200 ),
               headLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5),
               headLabel.widthAnchor.constraint(equalTo: margins.widthAnchor),
               subLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 30 ),
               subLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5),
               subLabel.widthAnchor.constraint(equalTo: margins.widthAnchor, constant: -15),
               someImage.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5),
               someImage.heightAnchor.constraint(equalToConstant: 64),
               someImage.widthAnchor.constraint(equalToConstant: 100),
               someImage.bottomAnchor.constraint(equalTo: headLabel.topAnchor, constant: -20)
           ])
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
