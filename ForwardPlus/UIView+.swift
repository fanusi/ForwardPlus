//
//  UIView+.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 24/06/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func HeightContraint(cst: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: cst)
        self.addConstraint(heightConstraint)
        
    }
    
    
}
