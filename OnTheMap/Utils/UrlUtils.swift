//
//  UrlUtils.swift
//  OnTheMap
//
//  Created by akhil mantha on 02/05/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import Foundation
import UIKit

let errorString = "Invalid Link"

func openUrlInSafari (urlString: String?, viewController: UIViewController) {
    let app = UIApplication.shared
    
    guard let urlString = urlString,
        let url = URL(string: urlString) else {
            viewController.showSimpleAlert(text: errorString)
            return
            }
    if (!app.canOpenURL(url)){
        viewController.showSimpleAlert(text: errorString)
    }
}
