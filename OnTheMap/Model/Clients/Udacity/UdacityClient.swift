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
    
}
