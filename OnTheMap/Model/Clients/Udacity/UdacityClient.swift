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



}
