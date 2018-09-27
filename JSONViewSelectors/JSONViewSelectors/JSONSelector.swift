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
            return nodeMatches("class", matching: str, node: item)
        }) {
            return matchingSubviews
        }
        return nil
    }
    
    func locateIdentifier(_ str: String) -> [Dictionary<String, Any>]? {
        if let matchingSubviews = db.search(matching: {(item) -> Bool in
            return nodeMatches("identifier", matching: str, node: item)
        }) {
            return matchingSubviews
        }
        return nil
    }
    
    func locateClassName(_ str: String) -> [Dictionary<String, Any>]? {
        if let matchingSubviews = db.search(matching: {(item) -> Bool in
            return nodeMatches("classNames", matching: str, node: item)
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
    
    func nodeMatches(_ key: String, matching value: String, node: Dictionary<String, Any>) -> Bool {
        if key == "classNames" {
            if let classNames = node["classNames"] as? [String] {
                for name in classNames {
                    if name == value {
                        return true
                    }
                }
            }
        } else if key == "identifier" {
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
