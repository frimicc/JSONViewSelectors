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
    
    func locateClass(_ str: String) -> [Dictionary<String, Any>]? {
        if let matchingSubviews = searchSubviews(node: dict, matching: {(item) -> Bool in
                return nodeMatches("class", matching: str, node: item)
            }) {
            return matchingSubviews
        }
        return nil
    }

    func locateIdentifier(_ str: String) -> [Dictionary<String, Any>]? {
        if let matchingSubviews = searchSubviews(node: dict, matching: {(item) -> Bool in
            return nodeMatches("identifier", matching: str, node: item)
        }) {
            return matchingSubviews
        }
        return nil
    }

    func getSubviews(_ node: Dictionary<String, Any>) -> [Dictionary<String, Any>]? {
        if let subviews = node["subviews"] as? [Dictionary<String, Any>] {
            return subviews
        } else if let contentView = node["contentView"] as? Dictionary<String, Any> {
            if let subviews = contentView["subviews"] as? [Dictionary<String, Any>] {
                return subviews
            }
        }
        return nil
    }
    
    func getIdentifier(_ node: Dictionary<String, Any>) -> String? {
        if let identifier = node["identifier"] as? String {
            return identifier
        } else if let control = node["control"] as? Dictionary<String, Any> {
            if let identifier = control["identifier"] as? String {
                return identifier
            }
        }
        return nil
    }
    
    func searchSubviews(node: Dictionary<String, Any>, matching matchCallback: (Dictionary<String, Any>) -> Bool) -> [Dictionary<String, Any>]? {
        var returnNodes: [Dictionary<String, Any>] = []
        if let subviews = getSubviews(node) {
            for item in subviews {
                if matchCallback(item) {
                    returnNodes.append(item)
                    //TODO: recurse if looking for children as well as the parent
                } else {
                    if let matchingSubviews = searchSubviews(node: item, matching: matchCallback) {
                        returnNodes.append(contentsOf: matchingSubviews)
                    }
                }
            }
            return returnNodes
        }
        return nil
    }
    
    func nodeMatches(_ key: String, matching value: String, node: Dictionary<String, Any>) -> Bool {
        if key == "identifier" {
            if let nodeValue = getIdentifier(node), nodeValue == value {
                return true
            }
        } else if let nodeValue = node[key] as? String {
            if nodeValue == value {
                return true
            }
        }
        return false
    }
}
