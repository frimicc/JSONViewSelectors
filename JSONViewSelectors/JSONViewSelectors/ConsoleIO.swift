//
//  ConsoleIO.swift
//  JSONViewSelectors
//
//  Created by Michael Friedman on 9/26/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

class ConsoleIO {
    
    static func databaseURLFromArgs() -> URL? {
        let args = CommandLine.arguments
        if args.count == 3 {
            if args[1] == "--db" {
                let location = args[2]
                if let dbURL = URL(string: location) {
                    return dbURL
                }
            }
        }
        return nil
    }
    
    static func printResults(_ inputNodes: [Dictionary<String, Any>]) {
        for item in inputNodes {
            if let output = JSONDatabase.itemAsJSON(item) {
                print(output)
            }
        }
        print("Found \(inputNodes.count) \(inputNodes.count == 1 ? "match" : "matches").")
    }

    static func printUsage() {
        let usage = """
JSONViewSelectors --db <url to JSON file>

If no --db is provided, the script will exit.
After creating the DB from the JSON file, the script lets you enter CSS selectors at the prompt and finds the matching nodes in the file. Type 'q' to quit.

NOTE: If you are loading a JSON file from GitHub, be sure to use the "Raw" data URL.
"""
        print(usage)
    }
}
