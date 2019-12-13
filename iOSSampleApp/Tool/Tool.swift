//
//  Tool.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/3/19.
//  Copyright © 2019 seak. All rights reserved.
//

import Foundation


class Tool {
    class func fetchLocalData(forResource:String, root: String) -> Array<Any>{
           var data: Data?
           if let path = Bundle.main.path(forResource: forResource, ofType: "json") {
               do {
                   data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                   do{
                       let json =  try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                       let jsonDictionary =  json as! Dictionary<String,Any>
                       let data = jsonDictionary[root] as! Array<Dictionary<String,Any>>
                       return data
                   }catch let error{
                      // print(error.localizedDescription)
                   }
               } catch let error {
                  // print(error.localizedDescription)
               }
           }
           return []
       }
    
    class func getMenus() -> Array<Any>{
        return fetchLocalData(forResource: "menus", root: "MenuList")
    }
    
    class func getReviewTxn() -> Array<Any> {
        return fetchLocalData(forResource: "Bill", root: "ReviewBill")
    }
    
}
