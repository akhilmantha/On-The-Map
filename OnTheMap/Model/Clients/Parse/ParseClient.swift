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
        requestWithHeader.addValue(ParseClient.HeaderKeys.ApplicationID, forHTTPHeaderField: "X-Parse-Application-Id")
        requestWithHeader.addValue(ParseClient.HeaderKeys.ApiKey, forHTTPHeaderField: "X-Parse-API-Key")
        
        return requestWithHeader
    }
    
    func addPostOrPutParseHeader (request: URLRequest) -> URLRequest{
        var requestWithHeader = addParseHeader(request: request)
        requestWithHeader.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return requestWithHeader
    }
    
    //Mark: GET
    
    func taskForGETMethod(_ method:String, parameters:[String:AnyObject], completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
        
        //Build the URL, configure the request
        let request = URLRequest(url: urlFromParameters(parameters as [String: AnyObject], withPathExtension: method, api: .Parse))
        
        //add request header
        let requestWithHeader =  addParseHeader(request: request)
        
        
    }
    
}
