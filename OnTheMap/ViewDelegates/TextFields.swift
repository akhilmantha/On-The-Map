//
//  TextFields.swift
//  OnTheMap
//
//  Created by akhil mantha on 02/05/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    
    public struct keyboardYLimit {
        static var buttonY: CGFloat = 0.0
    }
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Mark: keyboard
    func getViewShift(notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo!
        let keyboardSize = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue
    }
    
    
    
    
    
    
    
}
