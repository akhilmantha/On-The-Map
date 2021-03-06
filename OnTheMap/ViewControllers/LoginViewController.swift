//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by akhil mantha on 28/04/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    
    // MARK: Properties
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var signUpButton: UIButton!
    
    let signUpUrl = "https://www.udacity.com/account/auth#!/signup"
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButtons()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        view.setNeedsLayout()
        view.layoutIfNeeded()
        keyboardYLimit.buttonY = (loginButton?.frame.origin.y)! + stackView.frame.origin.y + contentView.frame.origin.y
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeToKeyboardNotifications()
    }
    
    
    // MARK: Actions
    @IBAction func userDidTapView(_ sender: AnyObject) {
        resignIfFirstResponder(userNameTextField)
        resignIfFirstResponder(passwordTextField)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        userDidTapView(self)
        
        if userNameTextField.text!.isEmpty ||
            passwordTextField.text!.isEmpty {
            self.showSimpleAlert(text:"Username or Password Empty.")
        }
        else {
            self.view.showBlurLoader()
            getSessionId()
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        if let url = URL(string: signUpUrl) {
            let signUpVc = SFSafariViewController(url: url)
            present(signUpVc, animated: true, completion: nil)
        }
    }
    
    
    // MARK: Network
    func getSessionId() {
        let userName = userNameTextField.text
        let password = passwordTextField.text
        
        UdacityClient.sharedInstance().postToGetSessionID(userName: userName!, password: password!) { (success, error) in
            if let error = error {
                print("There was an error at postToGetSessionID: \(error)")
                self.showSimpleAlert(text:error.localizedDescription)
            }
            else if success {
                print ("Logged in!!")
                self.presentMapAndTableTabbedView()
            }
            self.view.removeBlurLoader()
        }
    }
    
    // MARK: Navigation
    func presentMapAndTableTabbedView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapAndTableTabbedView") as! UINavigationController
        self.present(vc, animated: true, completion: nil)
    }
}
