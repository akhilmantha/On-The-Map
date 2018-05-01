//
//  UdacityClient.swift
//  OnTheMap
//
//  Created by akhil mantha on 29/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import Foundation

class UdacityClient : NSObject {
    
    //Mark: Properties
    // shared session
    
    var session = URLSession.shared
    
    // authentication state
    var requestToken: String? = nil
    
    // Session struct
    struct UdacitySession {
        let sessionId : String
        let expirationDate : String
        let userId: String
        
        //Mark: Initializers
        init(session: String, expiration: String, user: String) {
            sessionId = session
            expirationDate = expiration
            userId = user
        }
        func isDateExpired() -> Bool {
            let formatter = DateFormatter()
            if let utcDate = formatter.dateFromApiString(expirationDate) {
                return Date().compare(utcDate) == .orderedDescending
            }
            return true
        }
        
        }
    
    //Mark: Initializers
    
    override  init(){
        super.init()
    }
    func taskForPostMethod(_ method: String, parameters: [String: AnyObject], jsonBody: Data,completionHandlerForPost: @escaping(_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask{
        
        //Build the URL & Configure the request
        var request = URLRequest(url: urlFromParameters(parameters, withPathExtension: method, api: .Udacity))
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField:"Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonBody
        
        //Make the request
        let task = session.dataTask(with: request as URLRequest){ (data, response, error) in
            
            guaard let usefulData = self.getUsefulData(domain: "taskForPostMethod", request: request as URLRequest, data: data, response: data, error: error as NSError?, completionaHandler: completionHandlerForPost) else {
                return
            }
            convertDataWithCompletionHandler(usefulData, completionHandlerForConvertData: completionHandlerForPost)
        }
        //start the request
        task.resume()
        return task
        
    }
    
    
    //Get the data response and delete the first 5 characters
    
    func getUsefulData(domain: String, request:URLRequest, data: Data?,response: URLResponse?, error: NSError?, completionaHandler: @escaping(_ result: AnyObject?, _ error: NSError?) -> Void) -> Data?{
        
        let data = getData(domain: domain, request: request, data: data, response: response, error: error, completionHandler: completionaHandler)
        
        guard let responseData = data else {
        return nil
    }

        //parse and use the data (passes in the completion handler)
        let range = Range(5..<responseData.count)
        //subset of response data
        let usefulData = responseData.subdata(in: range)
        return usefulData
}
    
    //shared instance
    
    class func sharedInstance() -> UdacityClient {
        
        struct singleton{
            static var sharedInstance = UdacityClient()
        }
        return singleton.sharedInstance
    }
    
}
