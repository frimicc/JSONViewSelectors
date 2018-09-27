//
//  main.swift
//  JSONViewSelectors
//
//  Created by Michael Friedman on 9/25/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

func printResults(_ inputNodes: [Dictionary<String, Any>]) {
    for item in inputNodes {
        if let output = JSONDatabase.itemAsJSON(item) {
            print(output)
        }
    }
    print("Found \(inputNodes.count) \(inputNodes.count == 1 ? "match" : "matches").")
}


let JSONViewFile = URL(string: "https://raw.githubusercontent.com/jdolan/quetoo/master/src/cgame/default/ui/settings/SystemViewController.json")!
if let input = try? String(contentsOf: JSONViewFile) {
    let db = JSONDatabase(input)
    if !db.isEmpty {
        let selector = JSONSelector(db)
        print("Please enter your queries, one per line.\nType 'q' to quit.\n>", terminator: " ")
        while let line = readLine() {
            if line == "q" {
                break
            }
            if let inputNodes = selector.selectFromDB(line) {
                printResults(inputNodes)
            } else {
                print("No matches.")
            }
            print(">", terminator: " ")
        }
    }
}
