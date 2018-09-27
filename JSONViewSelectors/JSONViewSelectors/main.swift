//
//  main.swift
//  JSONViewSelectors
//
//  Created by Michael Friedman on 9/25/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

// Get Database file and set it up.
if let JSONViewFileURL = ConsoleIO.databaseURLFromArgs() {
    if let input = try? String(contentsOf: JSONViewFileURL) {
        let db = JSONDatabase(input)
        if !db.isEmpty {
            let selector = JSONSelector(db)
            
            // Now that we are working, take queries.
            print("Please enter your queries, one per line.\nType 'q' to quit.\n>", terminator: " ")
            while let line = readLine() {
                if line == "q" {
                    break
                }
                if let inputNodes = selector.selectFromDB(line) {
                    ConsoleIO.printResults(inputNodes)
                } else {
                    print("No matches.")
                }
                print(">", terminator: " ")
            }
            exit(0)
        }
    }
}
// If anything failed, print the usage.
ConsoleIO.printUsage()
