//
//  main.swift
//  JSONViewSelectors
//
//  Created by Michael Friedman on 9/25/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

let file = URL(string: "https://raw.githubusercontent.com/jdolan/quetoo/master/src/cgame/default/ui/settings/SystemViewController.json")!
if let input = try? String(contentsOf: file) {
    let db = JSONDatabase(input)
    let selector = JSONSelector(db)
    if let inputNodes = selector.selectFromDB("#windowMode") {
        print("Found \(inputNodes.count) matches:")
        for item in inputNodes {
            if let output = db.itemAsJSON(item) {
                print(output)
            }
        }
    }
}

//
//while let line = readLine() {
//}
