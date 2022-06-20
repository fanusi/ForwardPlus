//
//  ViewController.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 16/06/2022.
//

import UIKit

final class ViewController1: UIViewController {
    static let identifer = "ViewController1"

    
    var number: Int = 0
    static let idc: Int = 1

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        populateDataObjects()
        
        for i in 0...fObjects.count-1 {
            
            print(fObjects[i].id)
            print(fObjects[i].tab)
            print(fObjects[i].sub)
            print(fObjects[i].name)
            print(fObjects[i].value)
            
        }
        
    }
}
