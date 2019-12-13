//
//  BillPaymentService.swift
//  iOSSampleApp
//
//  Created by kimseak on 12/7/19.
//  Copyright © 2019 seak. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class BillPaymentService: DataService {
    private let VALIDATE_CONSUMER = "getConsumerInfo"
    private let TXN_BILL = "consumerPayment"
    
    
    
    public func checkConsumerlogin(consumerNumber: String, success: @escaping (Bool) -> (), failure: @escaping (String) -> ()){
        let params:Parameters = ["consumerID": consumerNumber]
        requestAuthPostMethodPostJSON(params: params , url: VALIDATE_CONSUMER, success: { (result) in
            let data = JSON(result)
            let status = data["consumerInfoResp"]["statusCode"].stringValue
            if status == "success" {
                success(true)
            }else {
                failure( data["consumerInfoResp"]["message"].stringValue)
            }
        }) { (error) in
            failure(error ?? "")
        }
    }
    
       public func payment(consumerNumber: String, success: @escaping (Bool) -> (), failure: @escaping (String) -> ()){
           
           let params:Parameters = ["consumerID": consumerNumber]
           
           requestAuthPostMethodPostJSON(params: params , url: TXN_BILL, success: { (result) in
               let data = JSON(result)
               let status = data["consumerPaymentResp"]["statusCode"].stringValue
               if status == "success" {
                   success(true)
               }else {
                   failure( data["consumerPaymentResp"]["message"].stringValue)
               }
           }) { (error) in
               failure(error ?? "")
           }
       }
}
