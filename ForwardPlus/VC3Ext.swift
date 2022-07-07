//
//  VC3Ext.swift
//  ForwardPlus
//
//  Created by Stéphane Trouvé on 05/07/2022.
//

import Foundation
import CoreXLSX

extension ViewController3 {
    
    func populateDataObjects () {
        
        var name1: [String] = []
        var position: [String] = []
        var status: [String] = []
        
        guard let filepath = Bundle.main.path(forResource: "Forward plus xcode2", ofType: "xlsx") else {

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
              let columnCStrings = worksheet.cells(atColumns: [ColumnReference("C")!])
                .compactMap { $0.stringValue(sharedStrings) }
            
                name1 = columnCStrings

            }
                
            if let sharedStrings = try! file.parseSharedStrings() {
              let columnJStrings = worksheet.cells(atColumns: [ColumnReference("J")!])
                .compactMap { $0.stringValue(sharedStrings) }
            
                position = columnJStrings

            }
                
            if let sharedStrings = try! file.parseSharedStrings() {
              let columnOStrings = worksheet.cells(atColumns: [ColumnReference("O")!])
                .compactMap { $0.stringValue(sharedStrings) }
            
                status = columnOStrings

            }
            
            eObjects.removeAll()
                
//            print(status.count)
//                print(name1.count)
//                print(position.count)
//
//            print("---")
                
            let rows = worksheet.data?.rows.count ?? 1
            //print(rows)
                
            for i in 1...rows-2 {
                
                let newObject = EmployeeData(id: i, fullName: name1[i], position: position[i], status: status[i])
                    eObjects.append(newObject)

            }
            
          }
            
        }
    
    }
    
}
