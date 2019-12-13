//
//  ReviewTxnModel.swift
//  iOSSampleApp
//
//  Created by kimseak on 12/7/19.
//  Copyright © 2019 seak. All rights reserved.
//

import Foundation

class ReviewTxnModel {
    var title = ""
    var value = ""
    
  
    init(data:NSDictionary) {
         title = data["title"] as? String ?? ""
         value = data["value"] as? String ?? ""
    }
    
}
