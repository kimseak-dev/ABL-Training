//
//  LoginService.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/6/19.
//  Copyright © 2019 seak. All rights reserved.
//

import Foundation
import SwiftyJSON

class LoginService: DataService{
    
    let LoginMethod = "Login"
    

    public func login(login: LoginModel, success: @escaping (User) -> (), failure: @escaping (String) -> ()){
        let data = ["username": login.username, "password": login.password, "grant_type": "password"]
        self.requestGetMethodPostJSON(params: data, url: LoginMethod, success: { (result) in
            let user = User()
            user.config(data: result)
            success(user)
        }) { (error) in
            failure(error ?? "Error")
        }
        
        
        
        
    }
    
    
}
