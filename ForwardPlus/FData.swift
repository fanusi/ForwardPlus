//
//  FData.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 20/06/2022.
//

import Foundation

public class FData {
    
    var id: Int
    var tab: String
    var sub: String
    var name: String
    var value: String
    
    init(id: Int, tab: String, sub: String, name: String, value: String) {

        self.id = id
        self.tab = tab
        self.sub = sub
        self.name = name
        self.value = value

    }
    
}
