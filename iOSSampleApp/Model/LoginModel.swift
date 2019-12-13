//
//  LoginModel.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/6/19.
//  Copyright © 2019 seak. All rights reserved.
//

import Foundation

class LoginModel {
    
    // txn
    public var username = ""
    public var password = ""
    
    public func isValidToLogin() -> Bool{
        if username.isEmpty || password.isEmpty {
            return true
        }
        return false
    }
    
    
}
