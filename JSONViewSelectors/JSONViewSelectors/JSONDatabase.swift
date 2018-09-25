//
//  JSONDatabase.swift
//  JSONViewSelectors
//
//  Created by Michael Friedman on 9/25/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

class JSONDatabase {
    var dict: Dictionary<String, Any> = [:]
    var isEmpty: Bool = true
    
    init(_ str: String) {
        if let data = str.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                dict = json as! Dictionary<String, Any>
                isEmpty = false
            } catch {
                // can't parse, return empty dict
                print("\(error)")
            }
        }
    }
    
    func itemAsJSON(_ item: Dictionary<String, Any>) -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: item, options: []) {
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        }
        return nil
    }
}
