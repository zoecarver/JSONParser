//
//  Main.swift
//  JSONParser
//
//  Created by Zoe IAMZOE.io on 8/29/18.
//  Copyright © 2018 Zoe IAMZOE.io. All rights reserved.
//

import Foundation
import SwiftyJSON

@dynamicMemberLookup
public struct JSONParser {
    
    private let json: JSON
    
    public var value: Any? {
        return self.json.object
    }
    
    public init (parseObject json: JSON) {
        self.json = json
    }
    
    public init (parseString json: String) throws {
        guard let data = json.data(using: .utf8) else {
            throw "Could not create data from jsonString"
        }
        
        self.json = try JSON(data: data)
    }
    
    public init (parseData json: Data) throws {
        self.json = try JSON(data: json)
    }
    
    
    public subscript(dynamicMember member: String) -> JSONParser {
        get {
            return JSONParser(parseObject: self.json[member])
        }
    }
    
    public subscript(index: Int) -> JSONParser {
        get {
            return JSONParser(parseObject: self.json[index])
        }
    }
}

extension String: Error {}
