//
//  SfcrSource.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 20/06/2022.
//

import Foundation
import CoreXLSX

extension ViewController1 {

    func populateDataObjects () {
        
        var tab: [String] = []
        var sub: [String] = []
        var name1: [String] = []
        var value1: [String] = []
        
        guard let filepath = Bundle.main.path(forResource: "Forward plus xcode1", ofType: "xlsx") else {

            fatalError("Error n1")
        }

        guard let file = XLSXFile(filepath: filepath) else {
          fatalError("XLSX file at \(filepath) is corrupted or does not exist")
        }

        for wbk in try! file.parseWorkbooks() {
            for (name, path) in try! file.parseWorksheetPathsAndNames(workbook: wbk) {
            
            if let worksheetName = name {
              print("This worksheet has a name: \(worksheetName)")
            }

            let worksheet = try! file.parseWorksheet(at: path)
            
                
            if let sharedStrings = try! file.parseSharedStrings() {
              let columnBStrings = worksheet.cells(atColumns: [ColumnReference("B")!])
                .compactMap { $0.stringValue(sharedStrings) }
            
                tab = columnBStrings

            }
                
            if let sharedStrings = try! file.parseSharedStrings() {
              let columnCStrings = worksheet.cells(atColumns: [ColumnReference("C")!])
                .compactMap { $0.stringValue(sharedStrings) }
            
                sub = columnCStrings

            }
                
            if let sharedStrings = try! file.parseSharedStrings() {
              let columnDStrings = worksheet.cells(atColumns: [ColumnReference("D")!])
                .compactMap { $0.stringValue(sharedStrings) }
            
                name1 = columnDStrings

            }
                
            if let sharedStrings = try! file.parseSharedStrings() {
              let columnEStrings = worksheet.cells(atColumns: [ColumnReference("E")!])
                .compactMap { $0.stringValue(sharedStrings) }
            
                value1 = columnEStrings

            }
            
            fObjects.removeAll()
                
              
            let rows = worksheet.data?.rows.count ?? 1
            print(rows)
                
            for i in 0...rows-1 {
                
                    let newObject = FData(id: i, tab: tab[i], sub: sub[i], name: name1[i], value: value1[i])
                    fObjects.append(newObject)

            }
            
          }
            
        }
    
    }
    
    func riskObjectsCount() -> Int {
        
        var counter: Int = 0
        
        for fobject in fObjects {
            if fobject.sub == "Risks" {
                counter += 1
            }
        }
        return counter
    }
    
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
    
    func provisionsOutput(index: CGFloat, Fobject1: FData, Fobject2: FData) -> String {
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        //formatter.decimalSeparator = "." // Default separator is dependent to the current local.
        
        
        switch index {
        
        case 0:
            
            let words = Fobject1.name.byWords
            let word2 = words[0]
            
            switch word2 {
            
            case "Gross":
                return String("   Best Estimate")
            case "Risk":
                return String("   Risk Margin")
            case "TP":
                return String("   Tech. Provisions")
            default:
                return "Error"
            
            }
            
        case 1:
            return formatter.string(for: Double(Fobject1.value)) ?? "No value"
        case 2:
            return formatter.string(for: Double(Fobject2.value)) ?? "No value"
        case 3:
            let sum:Double = (Double(Fobject1.value) ?? 0) + (Double(Fobject2.value) ?? 0)
            return formatter.string(for: sum) ?? "No value"
        default:
            return "Error"
        
        }
        
    }
    
    func solvencyOutput(index: CGFloat, Fobject1: FData) -> String {
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        //formatter.decimalSeparator = "." // Default separator is dependent to the current local.
        
        
        switch index {
        
        case 0:
            return String("   " + Fobject1.name)
        case 1:
            switch Fobject1.name {
                case "Solvency 2 Ratio":
                    return String(format: "%.0f%%", 100 * (Double(Fobject1.value) ?? 0))
                default:
                    return formatter.string(for: Double(Fobject1.value)) ?? "No value"
            }
        default:
            return "Error"
        }
        
    }

}

