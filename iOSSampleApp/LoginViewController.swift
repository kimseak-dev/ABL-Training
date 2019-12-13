//
//  LoginViewController.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/3/19.
//  Copyright © 2019 seak. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let login = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 4
        userNameTextField.delegate = self
        paswordTextField.delegate = self
        activityIndicator.stopAnimating()
        self.tabBarController?.delegate = self
    }
    
    
    
    
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        sumbitToServer()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
           switch textField {
           case userNameTextField:
               login.username = userNameTextField.text!
               break
           case paswordTextField:
               login.password = paswordTextField.text!
               break
           default:
               break
           }
       }
    
    

}




extension LoginViewController {
    private func sumbitToServer(){
        
        
        
 
        userNameTextField.resignFirstResponder()
        paswordTextField.resignFirstResponder()
        
        // validation
        if login.isValidToLogin() {
            self.presentMsg(msg: "Please enter information")
        }
        
        login.username = "Thai"
        login.password = "Pa$$wordQR$129"
        
        
        
        let service = LoginService()
        activityIndicator.startAnimating()
        service.login(login: login, success: { (result) in
    
            
            print(result)
            self.appDelegate.user = result
            self.appDelegate.user.isLogin = true
            
            if self.appDelegate.user.isLogin {
                self.tabBarController?.selectedIndex = 0
            }
           
            self.activityIndicator.stopAnimating()
        }) { (error) in
            self.presentMsg(msg: error)
            self.activityIndicator.stopAnimating()
        }
        
        
       
        
    }
}

extension LoginViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if tabBarController.selectedIndex == 0 {
            if appDelegate.user.isLogin {
                let alert = UIAlertController(title: "", message: "Are you want to logout?",        preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                    self.appDelegate.user.isLogin = false
                    self.dismiss(animated: true, completion: nil)
                }))
                alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (result) in
                    self.dismiss(animated: true, completion: nil)
                }))
                 self.present(alert, animated: true, completion: nil)
                return false
            }
            
        }
        
        return true
      
        
    }
}


extension UIViewController {
    public func presentMsg(msg: String){
        let alert = UIAlertController(title: "", message: msg,        preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true) {
        
            }
        }))
         self.present(alert, animated: true, completion: nil)
    }
    
    
}


var vSpinner : UIView?
 
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
   

}
}
