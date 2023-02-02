//
//  TableViewController.swift
//  learningSwift
//
//  Created by Артем Аносов on 26.01.2023.
//

import UIKit

struct Country {
    var isoCode : String
    var name : String
}

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate   {
    
    var countries = [
        Country(isoCode: "at", name: "Austria"),
        Country(isoCode: "be", name: "Belgium"),
        Country(isoCode: "de", name: "Germany"),
        Country(isoCode: "el", name: "Greece"),
        Country(isoCode: "fr", name: "France"),
        Country(isoCode: "ru", name: "Russia"),
        Country(isoCode: "ua", name: "Ukraine"),
        Country(isoCode: "uk", name: "United Kingdom")
        
    ]
    
    let someTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 31/255, green: 1/255, blue: 35/255, alpha: 1)
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 90))
        navBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        navBar.isTranslucent = false
        title = "There is some table"
        let backToMainButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        navigationItem.setLeftBarButton(backToMainButton, animated: true)
        someTable.dataSource = self
        someTable.delegate = self
        someTable.isEditing = true
        someTable.allowsSelectionDuringEditing = true
        view.addSubview(someTable)
        view.addSubview(navBar)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        someTable.frame = view.bounds
    }
    
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        header.backgroundColor = UIColor(red: 31/255, green: 1/255, blue: 35/255, alpha: 1)
        let imageView = UIImageView(image: UIImage(systemName: "house"))
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        header.addSubview(imageView)
        imageView.frame = CGRect(x: 5, y: 15, width: header.frame.size.height - 40, height: header.frame.size.height - 40)
        let label = UILabel(frame: CGRect(x: 10 + imageView.frame.size.width, y: 5,
                                          width: header.frame.size.width  - 15 - imageView.frame.size.width,
                                          height: header.frame.size.height - 10))
        header.addSubview(label)
        label.text = "Countries"
        label.font = .systemFont(ofSize: 22, weight: .thin)
        label.textColor = .white
        return header
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveObject = self.countries[sourceIndexPath.row]
        countries.remove(at: sourceIndexPath.row)
        countries.insert(moveObject, at: destinationIndexPath.row)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell =  someTable.dequeueReusableCell(withIdentifier: "countryCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countryCell")
        }
        let country = countries[indexPath.row]
        cell?.textLabel?.text = country.name
        cell?.detailTextLabel?.text = country.isoCode
        cell?.imageView?.image = UIImage(named: "\(country.isoCode).jpg")
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppDelegate.shared.rootViewController.switchToMainScreen()
    }

@objc
   private func back() {
      // navigate to the Main Screen
       AppDelegate.shared.rootViewController.switchToMainScreen()
   }
}

