//
//  ViewController.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 16/06/2022.
//

import UIKit

public let font1 = "Optima-Regular"

final class ViewController1: UIViewController {
    static let identifer = "ViewController1"

    @IBOutlet weak var StackView: UIStackView!
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
        headerFLabel.customLabel1(yvalue: marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "Keyfacts")
        KeyFactsView.addSubview(headerFLabel)
        
        var a:CGFloat = 1

        for i in 0...fObjects.count - 1 {
            
            if fObjects[i].sub == "Company facts" {
            
                let newLabel = UILabel()
                newLabel.customLabel1(yvalue: a * labelHeight + (a + 1) * marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "- " + fObjects[i].value)
                KeyFactsView.addSubview(newLabel)
                
                a += 1
                
            }
            
        }
        
        // Update View Height so all facts are visible
        KeyFactsView.updateHeightConstraint(newHeight: a * labelHeight + (a + 2) * marginY, identifier: "KeyFactsConstraint")
        
        
        // Organizational Chart
        // Make sure your ChartView constraint equals minimum chartHeight + labelHeight + 4 * marginY
        let chartHeight: CGFloat = 200
        
        let headerCLabel = UILabel()
        headerCLabel.customLabel1(yvalue: marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "Organizational Chart")
        ChartView.addSubview(headerCLabel)
        
        let chart = "Chart.jpg"
        let image = UIImage(named: chart)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: labelHeight + 4 * marginY, width: view.frame.width, height: chartHeight)
        imageView.contentMode = .scaleAspectFit
        ChartView.addSubview(imageView)
        
        ChartView.updateHeightConstraint(newHeight: chartHeight + 4 * marginY + 80, identifier: "ChartConstraint")
        
        // Gross Written Premium per country
        let headerGLabel = UILabel()
        headerGLabel.customLabel1(yvalue: 0, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "Gross Written Premium")
        GwpView.addSubview(headerGLabel)
        
        let topRowCountryName = UIView(frame: CGRect(x: 0, y: 2 * labelHeight, width: view.frame.width * 0.40, height: labelHeight))
        topRowCountryName.insertLabel1(text: "   Market", font: font1, fontsize: 20, middle: false)
        GwpView.addSubview(topRowCountryName)
        
        let topRowCountryYear = UIView(frame: CGRect(x: 0.4 * view.frame.width, y: 2 * labelHeight, width: view.frame.width * 0.20, height: labelHeight))
        topRowCountryYear.insertLabel1(text: "2020", font: font1, fontsize: 20, middle: true)
        GwpView.addSubview(topRowCountryYear)
        
        let topRowCountryYearN = UIView(frame: CGRect(x: 0.6 * view.frame.width, y: 2 * labelHeight, width: view.frame.width * 0.20, height: labelHeight))
        topRowCountryYearN.insertLabel1(text: "2021", font: font1, fontsize: 20, middle: true)
        GwpView.addSubview(topRowCountryYearN)
        
        let topRowCountryDiff = UIView(frame: CGRect(x: 0.8 * view.frame.width, y: 2 * labelHeight, width: view.frame.width * 0.20, height: labelHeight))
        topRowCountryDiff.insertLabel1(text: "Change", font: font1, fontsize: 20, middle: true)
        GwpView.addSubview(topRowCountryDiff)

        
        
        a = 3
        var b: CGFloat = 0
        var dummy:Bool = false

        for i in 0...fObjects.count - 1 {
            
            if fObjects[i].sub == "GWP" && dummy == false {
                
                //Reset x-axis parameter
                b = 0
                
                //Add four subviews representing market, previous year value, current year value and relative change
                for j in 0...3 {
                    
                    //subWidth defines relative size of screen the subview takes in
                    
                    let subWidth:CGFloat = j == 0 ? 0.40 : 0.20
            
                    let subView = UIView(frame: CGRect(x: b, y: a * labelHeight, width: view.frame.width * subWidth, height: labelHeight))
            
                    let labelText = gwpOutput(index: CGFloat(j), Fobject1: fObjects[i], Fobject2: fObjects[i+1])
                    
                    let middle:Bool = j == 0 ? false : true
                    
                    subView.insertLabel1(text: labelText, font: font1, fontsize: 15, middle: middle)
                    
                    b += view.frame.width * subWidth
                    
                    GwpView.addSubview(subView)
                                        
                }
                
                dummy = true
                a += 1
                
            } else {
            
                dummy = false
            
            }
            
        }
        
        // Update View Height so all facts are visible
        GwpView.updateHeightConstraint(newHeight: a * labelHeight + (a + 2) * marginY, identifier: "GwpConstraint")
        
        for i in 0...fObjects.count-1 {
            
            print(fObjects[i].id)
            print(fObjects[i].tab)
            print(fObjects[i].sub)
            print(fObjects[i].name)
            print(fObjects[i].value)
            
        }
        
    }
    
    
    //Support functions
    
    func gwpOutput(index: CGFloat, Fobject1: FData, Fobject2: FData) -> String {
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        //formatter.decimalSeparator = "." // Default separator is dependent to the current local.
        
        
        switch index {
        
        case 0:
            
            let words = Fobject1.name.byWords
            return String("   " + words[1])
        case 1:
            return formatter.string(for: Double(Fobject1.value)) ?? "No value"
        case 2:
            return formatter.string(for: Double(Fobject2.value)) ?? "No value"
        case 3:
            return String(format: "%.0f%%", 100 * ((Double(Fobject2.value) ?? 0) / (Double(Fobject1.value) ?? 1) - 1))
        default:
            return "Error"
        
        }
        
    }

    
}
