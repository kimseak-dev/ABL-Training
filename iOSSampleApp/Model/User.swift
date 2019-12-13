//
//  User.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/6/19.
//  Copyright © 2019 seak. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var expire = ""
    var issued = ""
    var userName = ""
    var expiresIn = ""
    var token_type = "bearer"
    var access_token = ""
    var isLogin = false

    public func config(data:JSON){
        expire = data[".expires"].stringValue
        issued = data[".issued"].stringValue
        userName = data["userName"].stringValue
        token_type = data["token_type"].stringValue
        access_token = data["access_token"].stringValue
        expiresIn = data["expires_in"].stringValue
    }
}
