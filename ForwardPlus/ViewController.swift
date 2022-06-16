//
//  ViewController.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 16/06/2022.
//

import UIKit

final class ViewController: UIViewController {
    static let identifer = "ViewController"

    @IBOutlet var label: UILabel!

    var number: Int = 0

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.text = number.description
    }
}
