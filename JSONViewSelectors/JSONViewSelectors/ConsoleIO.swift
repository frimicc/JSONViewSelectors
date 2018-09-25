//
//  ConsoleIO.swift
//  JSONViewSelectors
//
//  Created by Michael Friedman on 9/25/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

class ConsoleIO {
    func readAllStdin() -> String {
        var input: String = ""
        while let line = readLine() {
            input.append(contentsOf: line + "\n")
        }
        return input
    }
}
