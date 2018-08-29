//
//  main.swift
//  JSONParser-test
//
//  Created by Zoe IAMZOE.io on 8/29/18.
//  Copyright © 2018 Zoe IAMZOE.io. All rights reserved.
//

import Foundation
import JSONParser

let testString = """
{
    "name":"John",
    "age":30,
    "cars": {
        "car1":"Ford",
        "car2":"BMW",
        "car3":"Fiat"
    },
    "array": [
        1, 2, 3
    ]
}
"""

do {
    let json = try JSONParser(parseString: testString)
    
    print(json.cars.car2.value!)
} catch _ { }
