//
//  LocalMenu.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/3/19.
//  Copyright © 2019 seak. All rights reserved.
//

import Foundation

class LocalMenu {
    var title = ""
    var icon = ""
    var menuCode = ""
    var registerType = ""
    var prelogin = true
    var desc = ""

    
    init(data:NSDictionary) {
        icon = data["icon"] as? String ?? ""
        menuCode = data["menuCode"] as? String ?? ""
        registerType = data["regType"] as? String ?? ""
        prelogin = data["prelogin"] as? Bool ?? false
        desc = data["description"] as? String ?? ""
         title = data["en"] as? String ?? ""
    }
}
