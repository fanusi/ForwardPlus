//
//  EmployeeData.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 05/07/2022.
//

import Foundation

public class EmployeeData {
    
    var id: Int
    var fullName: String
    var position: String
    var status: String

    
    init(id: Int, fullName: String, position: String, status: String) {

        self.id = id
        self.fullName = fullName
        self.position = position
        self.status = status

    }
    
}
