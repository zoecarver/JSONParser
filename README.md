# JSONParser
A wrapper for [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) that adds support for dynamic member lookups in swift 4.2. 

### How to use
JSONParser takes either a JSON object, a string, or a Data object containing JSON. 

It turns this:
```swift
json["users"][0]["name"].string
```
Into this
```swift
json.users[0].name.value
```

### Example
Here is an example from [the test target](https://github.com/pudility/JSONParser/blob/master/JSONParser-test/main.swift):
```swift
import JSONParser

let testString = """
{
    "name":"John",
    "age":30,
    "cars": {
        "car1":"Ford",
        "car2":"BMW",
        "car3":"Fiat"
    }
}
"""

do {
    let json = try JSONParser(parseString: testString)
    
    print(json.cars.car2.value!) // BMW
} catch _ { }

```

### Disclamer
JSONParser relies on `@dynamicMemberLookup` which is only available in swift 4.2.

### Install

You can use carthage to install this framework:
```
github "pudility/JSONParser"
```
