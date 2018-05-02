//
//  UdacityClientUtils.swift
//  OnTheMap
//
//  Created by akhil mantha on 02/05/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import Foundation

extension UdacityClient{
    
    // replaces the key for the value that is contained in the method name
    
    func substitueKeyInJson(_ jsonPattern: String, key: String, value: String) -> String?{
        if jsonPattern.range(of: "{\(key)}") != nil {
            
            return jsonPattern.replacingOccurrences(of: "{\(key)}", with: value)
        }
        return nil
        }

    // Returns a json from a swift dictionary
    func jsonFromDictionary(_ dictionary:[String: AnyObject]) -> Data {
        var jsonData : Data! = nil
        do {
            jsonData = try JSONSerialization.data(withJSONObject: dictionary)
            return jsonData
        } catch {
            print("could not get json from dictionary: \(dictionary)")
        }
        return Data()
    }
    
}
