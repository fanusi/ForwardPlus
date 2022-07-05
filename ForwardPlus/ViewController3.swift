//
//  ViewController3.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 16/06/2022.
//

import UIKit

final class ViewController3: UITableViewController {
    static let identifer = "ViewController3"
    
    var number: Int = 0
    static let idc: Int = 3
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeesCell", for: indexPath) as! EmployeesCell
        cell.nameLabel.text = eObjects[indexPath.row].fullName
        cell.positionLabel.text = eObjects[indexPath.row].position
        
        if eObjects[indexPath.row].status == "Home" {
            cell.statusImageView = UIImageView(image: UIImage(named:"HO2.jpg"))
        } else {
            cell.statusImageView = UIImageView(image: UIImage(named:"Office.jpeg"))
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eObjects.count
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        populateDataObjects()
        
    }
    
    override func viewDidLoad() {
        //self.tableView.register(UINib(nibName: "EmployeesCell", bundle: nil), forCellReuseIdentifier: "EmployeesCell")
    }
}
