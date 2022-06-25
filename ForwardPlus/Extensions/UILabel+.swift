//
//  UILabel+.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 25/06/2022.
//

import Foundation
import UIKit

extension UILabel {
    
    func keyFacts(yvalue: CGFloat, height: CGFloat, width: CGFloat, fontsize: CGFloat, text: String) {
        
        //self.translatesAutoresizingMaskIntoConstraints = false
        //self.lineBreakMode = .byWordWrapping
        self.frame = CGRect(x: 10, y: yvalue, width: width - 20, height: height)
        self.numberOfLines = 2
        self.font = UIFont(name: self.font.fontName, size: fontsize)
        self.backgroundColor = .white
        self.text = text
        self.adjustsFontSizeToFitWidth = true
        
    }
    
    
}
