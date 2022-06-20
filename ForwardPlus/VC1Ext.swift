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

}

