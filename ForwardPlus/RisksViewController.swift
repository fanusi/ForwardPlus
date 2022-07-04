//
//  RisksViewController.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 28/06/2022.
//

import UIKit

class RiskViewController: UITableViewController {

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let riskobjects: Int =  riskObjectsCount()
        return riskobjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RiskTableViewCell", for: indexPath)
        let riskIndexMatrix: [Int] = riskObjectsIndexMatrix()
        let riskIndex = riskIndexMatrix[indexPath.row]
        cell.textLabel?.text = fObjects[riskIndex].name
        cell.detailTextLabel?.text = fObjects[riskIndex].value
        cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
        
        print(indexPath.row)
        print(cell.frame.height)
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title:String = "Risk Overview"
        return title

    }
    

    
}



extension RiskViewController {
    
    func riskObjectsCount() -> Int {
        
        var counter: Int = 0
        
        for fobject in fObjects {
            if fobject.sub == "Risks" {
                counter += 1
            }
        }
        return counter
    }
    
    func riskObjectsIndexMatrix() -> [Int] {
        
        var riskIndexMatrix:[Int] = []
        
        for i in 0...fObjects.count - 1 {
            if fObjects[i].sub == "Risks" {
                riskIndexMatrix.append(i)
            }
        }
        
        return riskIndexMatrix
    }
}
