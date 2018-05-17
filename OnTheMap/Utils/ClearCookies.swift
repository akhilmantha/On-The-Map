//
//  ClearCookies.swift
//  OnTheMap
//
//  Created by akhil mantha on 17/05/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import Foundation

func clearCookies () {
    if let cookies = HTTPCookieStorage.shared.cookies{
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
        
        for cookie in cookies{
            HTTPCookieStorage.shared.deleteCookie(cookie)
        }
        
        
    }
}
