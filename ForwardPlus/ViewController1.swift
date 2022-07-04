//
//  ViewController.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 16/06/2022.
//

import UIKit

public let font0 = "Optima-Regular"
public let font2 = "Menlo"
public let font1 = "Monaco"

public let backgroundcolor1: UIColor = UIColor(red: 242/255, green: 241/255, blue: 255/255, alpha: 1)
public let backgroundcolor2: UIColor = UIColor(red: 152/255, green: 247/255, blue: 255/255, alpha: 1)


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
        
        
        view.backgroundColor = backgroundcolor1
        // Company facts
        
        // Height per fact block; Margin between blocks
        let labelHeight:CGFloat = 35
        let marginY:CGFloat = 10
        let fontSize: CGFloat = 30
        
        let headerFLabel = UILabel()
        headerFLabel.customLabel1(yvalue: marginY, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "Keyfacts")
        headerFLabel.font = UIFont.boldSystemFont(ofSize: fontSize + 15)
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
        headerCLabel.font = UIFont.boldSystemFont(ofSize: fontSize + 15)
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
        headerGLabel.font = UIFont.boldSystemFont(ofSize: fontSize + 15)
        GwpView.addSubview(headerGLabel)
        
        let topRowCountryName = UIView(frame: CGRect(x: 0, y: 2 * labelHeight, width: view.frame.width * 0.40, height: labelHeight))
        topRowCountryName.insertLabel1(text: "   (in k €)", font: font1, fontsize: 20, middle: false)
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
        GwpView.updateHeightConstraint(newHeight: a * labelHeight + 3 * marginY, identifier: "GwpConstraint")
        
        
        //Technical Provisions
        let headerTLabel = UILabel()
        headerTLabel.customLabel1(yvalue: 0, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "Technical Provisions")
        headerTLabel.font = UIFont.boldSystemFont(ofSize: fontSize + 15)
        ProvisionsView.addSubview(headerTLabel)
        
        let topRowPrDescr = UIView(frame: CGRect(x: 0, y: 2 * labelHeight, width: view.frame.width * 0.40, height: labelHeight))
        topRowPrDescr.insertLabel1(text: "   (in k €)", font: font1, fontsize: 20, middle: false)
        ProvisionsView.addSubview(topRowPrDescr)
        
        let topRowPrUl = UIView(frame: CGRect(x: 0.4 * view.frame.width, y: 2 * labelHeight, width: view.frame.width * 0.20, height: labelHeight))
        topRowPrUl.insertLabel1(text: "U-Link", font: font1, fontsize: 20, middle: true)
        ProvisionsView.addSubview(topRowPrUl)
        
        let topRowPrNl = UIView(frame: CGRect(x: 0.6 * view.frame.width, y: 2 * labelHeight, width: view.frame.width * 0.20, height: labelHeight))
        topRowPrNl.insertLabel1(text: "Non-Link", font: font1, fontsize: 20, middle: true)
        ProvisionsView.addSubview(topRowPrNl)
        
        let topRowPrTot = UIView(frame: CGRect(x: 0.8 * view.frame.width, y: 2 * labelHeight, width: view.frame.width * 0.20, height: labelHeight))
        topRowPrTot.insertLabel1(text: "Total '21", font: font1, fontsize: 20, middle: true)
        ProvisionsView.addSubview(topRowPrTot)

        
        
        a = 3
        b = 0
        dummy = false

        for i in 0...fObjects.count - 1 {
            
            if fObjects[i].sub == "TP" && dummy == false {
                
                //Reset x-axis parameter
                b = 0
                
                //Add four subviews representing description, UL value, NL value and total
                for j in 0...3 {
                    
                    //subWidth defines relative size of screen the subview takes in
                    
                    let subWidth:CGFloat = j == 0 ? 0.40 : 0.20
            
                    let subView = UIView(frame: CGRect(x: b, y: a * labelHeight, width: view.frame.width * subWidth, height: labelHeight))
            
                    let labelText = provisionsOutput(index: CGFloat(j), Fobject1: fObjects[i], Fobject2: fObjects[i+1])
                    
                    let middle:Bool = j == 0 ? false : true
                    
                    subView.insertLabel1(text: labelText, font: font1, fontsize: 15, middle: middle)
                    
                    b += view.frame.width * subWidth
                    
                    ProvisionsView.addSubview(subView)
                                        
                }
                
                dummy = true
                a += 1
                
            } else {
            
                dummy = false
            
            }
            
        }
        
        // Update View Height so all facts are visible
        ProvisionsView.updateHeightConstraint(newHeight: a * labelHeight + 3 * marginY, identifier: "ProvisionsConstraint")
        
        // Solvency 2
        
        let headerSLabel = UILabel()
        headerSLabel.customLabel1(yvalue: 0, height: labelHeight, width: view.frame.width, fontsize: fontSize, text: "Solvency 2")
        headerSLabel.font = UIFont.boldSystemFont(ofSize: fontSize + 15)
        SolvencyView.addSubview(headerSLabel)
        
        let topRowSolDescr = UIView(frame: CGRect(x: 0, y: 2 * labelHeight, width: view.frame.width * 0.40, height: labelHeight))
        topRowSolDescr.insertLabel1(text: "   (in k €)", font: font1, fontsize: 20, middle: false)
        SolvencyView.addSubview(topRowSolDescr)
        
        let topRowSol = UIView(frame: CGRect(x: 0.4 * view.frame.width, y: 2 * labelHeight, width: view.frame.width * 0.20, height: labelHeight))
        topRowSol.insertLabel1(text: "Amount", font: font1, fontsize: 20, middle: true)
        SolvencyView.addSubview(topRowSol)
        
        a = 3
        b = 0
        dummy = false

        for i in 0...fObjects.count - 1 {
            
            if fObjects[i].sub == "S2 ratio" {
                
                //Reset x-axis parameter
                b = 0
                
                //Add two subviews representing description and amount
                for j in 0...1 {
                    
                    //subWidth defines relative size of screen the subview takes in
                    
                    let subWidth:CGFloat = j == 0 ? 0.40 : 0.20
            
                    let subView = UIView(frame: CGRect(x: b, y: a * labelHeight, width: view.frame.width * subWidth, height: labelHeight))
            
                    let labelText = solvencyOutput(index: CGFloat(j), Fobject1: fObjects[i])
                    
                    let middle:Bool = j == 0 ? false : true
                    
                    subView.insertLabel1(text: labelText, font: font1, fontsize: 15, middle: middle)
                    
                    b += view.frame.width * subWidth
                    
                    SolvencyView.addSubview(subView)
                                        
                }
                
                a += 1
                
            }
            
        }
        
        // Update View Height so all facts are visible
        SolvencyView.updateHeightConstraint(newHeight: a * labelHeight + 3 * marginY, identifier: "SolvencyConstraint")
        
        self.view.backgroundColorSubViews(BackColor: backgroundcolor1)
        
        // Risks
        let risks:Int = riskObjectsCount()
        RisksView.updateHeightConstraint(newHeight: CGFloat(risks * 60), identifier: "RisksConstraint")
        RisksView.backgroundColorSubViews(BackColor: backgroundcolor1)
        
    }
    
}
