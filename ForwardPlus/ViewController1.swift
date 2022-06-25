//
//  ViewController.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 16/06/2022.
//

import UIKit

final class ViewController1: UIViewController {
    static let identifer = "ViewController1"

    @IBOutlet weak var KeyFactsView: UIView!
    @IBOutlet weak var ChartView: UIView!
    @IBOutlet weak var GwpView: UIView!
    @IBOutlet weak var RisksView: UIView!
    @IBOutlet weak var ValuationView: UIView!
    @IBOutlet weak var ProvisionsView: UIView!
    @IBOutlet weak var SolvencyView: UIView!
    
    
    var number: Int = 0
    static let idc: Int = 1

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        populateDataObjects()
        
        // Company facts
        
        // Height per fact block; Margin between blocks
        let labelHeight:CGFloat = 35
        let marginY:CGFloat = 10
        let fontSize: CGFloat = 30
        
        let headerFLabel = UILabel()
        headerFLabel.keyFacts(yvalue: marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "Keyfacts")
        KeyFactsView.addSubview(headerFLabel)
        
        let Fact1Label = UILabel()
        Fact1Label.keyFacts(yvalue: labelHeight + 2 * marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "- " + fObjects[1].value)
        KeyFactsView.addSubview(Fact1Label)

        let Fact2Label = UILabel()
        Fact2Label.keyFacts(yvalue: 2 * labelHeight + 3 * marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "- " + fObjects[2].value)
        KeyFactsView.addSubview(Fact2Label)
        
        let Fact3Label = UILabel()
        Fact3Label.keyFacts(yvalue: 3 * labelHeight + 4 * marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "- " + fObjects[3].value)
        KeyFactsView.addSubview(Fact3Label)
        
        let Fact4Label = UILabel()
        Fact4Label.keyFacts(yvalue: 4 * labelHeight + 5 * marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "- " + fObjects[4].value)
        KeyFactsView.addSubview(Fact4Label)
        
        let Fact5Label = UILabel()
        Fact5Label.keyFacts(yvalue: 5 * labelHeight + 6 * marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "- " + fObjects[5].value)
        KeyFactsView.addSubview(Fact5Label)
        
        // Make sure your KeyFactsView constraint equals minimum (x+1) * labelHeight + (y+1) * marginY
        
        
        // Organizational Chart
        // Make sure your ChartView constraint equals minimum chartHeight + labelHeight + 4 * marginY
        let chartHeight: CGFloat = 200
        
        
        let headerCLabel = UILabel()
        headerCLabel.keyFacts(yvalue: marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "Organizational Chart")
        ChartView.addSubview(headerCLabel)
        
        let chart = "Chart.jpg"
        let image = UIImage(named: chart)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: labelHeight + 4 * marginY, width: view.frame.width, height: chartHeight)
        imageView.contentMode = .scaleAspectFill
        ChartView.addSubview(imageView)
        
        
        for i in 0...fObjects.count-1 {
            
            print(fObjects[i].id)
            print(fObjects[i].tab)
            print(fObjects[i].sub)
            print(fObjects[i].name)
            print(fObjects[i].value)
            
        }
        
    }
}
