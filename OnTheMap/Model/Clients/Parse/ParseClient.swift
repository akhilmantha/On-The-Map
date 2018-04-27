//
//  ParseClient.swift
//  OnTheMap
//
//  Created by akhil mantha on 28/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import Foundation

class ParseClient : NSObject {
    
    
    //Mark: Properties
    //Mark: shared session
    
    var session = URLSession.shared
    
    //Mark: Initializers
    
    override init() {
        super.init()
    }
    
    //Mark: Header
    
    func addParseHeader(request: URLRequest) -> URLRequest {
        var requestWithHeader = request
        requestWithHeader.addValue(, forHTTPHeaderField: <#T##String#>)
        
        
    }
    
    
    
}
