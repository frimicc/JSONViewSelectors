//
//  JSONSelector.swift
//  JSONViewSelectors
//
//  Created by Michael Friedman on 9/26/18.
//  Copyright © 2018 Michael Friedman. All rights reserved.
//

import Foundation

class JSONSelector {
    var db: JSONDatabase
    
    init(_ db: JSONDatabase) {
        self.db = db
    }
    
    func locateClass(_ str: String) -> [Dictionary<String, Any>]? {
        if let matchingSubviews = db.search(matching: {(item) -> Bool in
            if let nodeValue = item["class"] as? String, nodeValue == str {
                return true
            }
            return false
        }) {
            return matchingSubviews
        }
        return nil
    }
    
    func locateIdentifier(_ str: String) -> [Dictionary<String, Any>]? {
        if let matchingSubviews = db.search(matching: {(item) -> Bool in
            if let nodeValue = getIdentifier(item), nodeValue == str {
                return true
            }
            return false
        }) {
            return matchingSubviews
        }
        return nil
    }
    
    func locateClassName(_ str: String) -> [Dictionary<String, Any>]? {
        if let matchingSubviews = db.search(matching: {(item) -> Bool in
            if let classNames = item["classNames"] as? [String] {
                for name in classNames {
                    if name == str {
                        return true
                    }
                }
            }
            return false
        }) {
            return matchingSubviews
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
    
}
