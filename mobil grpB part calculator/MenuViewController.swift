//
//  MenuViewController.swift
//  mobil grpB part calculator
//
//  Created by Mobioapp on 7/25/17.
//  Copyright © 2017 Mobioapp. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var userNameOutlet: UILabel!
    
    let menuItems = ["Home","My Workshop","Enlist Your Workshop","My appiontments","login/logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        menuTableView.delegate = self
        menuTableView.dataSource = self

    }

   
    

    //table delegates and datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        cell.menuLabelOutlet.text = menuItems[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = menuItems[indexPath.row]
        if item == "login/logout" {
            
           dismiss(animated: true, completion: nil)
            
        }
    }



}
