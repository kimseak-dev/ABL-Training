//
//  DataService.swift
//  Ios-Engineer-Project
//
//  Created by kimseak on 6/1/19.
//  Copyright © 2019 Kimseak. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class DataService: NSObject {
    
    
    let pleaseCheckInternetConnection = "pleaseCheckInternetConnection"
    let serverWasUnReachablePleaseTryAgainLater = "Server was unreachable please try again later"
    let transactionFailPleaseContactForMoreInformation = "transactionFailPleaseContactForMoreInformation"
    let urlEndPoint = "https://acmob.acledabank.com.kh/LAO/"
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    // @desc: sesssion manager
    let sessionManager = Alamofire.SessionManager.default
    
    override init() {
        // @desc: set time out request server 2 mn (120s)
        sessionManager.session.configuration.timeoutIntervalForRequest = 120
    }
    
    /**
     check internet connection
     - Returns: if reach internet return true else return false
     */
    func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    
    
    /**
     request data with method: POST, response type json
     
     - Parameters: -params: data, url: METHOD
     - Returns:  if success return json else return error message
     
     - Remark: This function with get method, response with string
     
     */
    public func requestGetMethodPostJSON(params:Parameters, url:String, success: @escaping (JSON) -> (), failure: @escaping (String?) -> ()) {
        
        // @desc: internet connection
        if !isConnectedToInternet(){
            failure(self.pleaseCheckInternetConnection)
            return
        }
        
        // request header
        let headers: HTTPHeaders = ["Accept": "application/json"]
        let requestParameter = urlEndPoint + "" + url
        let urlConfig = requestParameter.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        // @desc: request method
        sessionManager.request(urlConfig, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: headers)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    
                    let statusCode = response.response!.statusCode
                    let jsonString = response.result.value ?? ""
                    
                    if statusCode == 200 {
                        // result sucess
                        success(JSON(jsonString as Any))
                    }else{
                        failure(self.transactionFailPleaseContactForMoreInformation)
                    }
                    
                    break
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        failure("false")
                    }else{
                        failure("false")
                    }
                    break
                }
        }
    }
    
    
    public func requestAuthPostMethodPostJSON(params:Parameters, url:String, success: @escaping (JSON) -> (), failure: @escaping (String?) -> ()) {
        
        // @desc: internet connection
        if !isConnectedToInternet(){
            failure(self.pleaseCheckInternetConnection)
            return
        }
        
        // request header
        let headers: HTTPHeaders = ["Accept": "application/json","Content-Type": "application/json", "Authorization": appDelegate.user.access_token ]
        let requestParameter = urlEndPoint + "api/" + url
        let urlConfig = requestParameter.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        // @desc: request method
        sessionManager.request(urlConfig, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    
                    let statusCode = response.response!.statusCode
                    let jsonString = response.result.value ?? ""
                    
                    if statusCode == 200 {
                        // result sucess
                        success(JSON(jsonString as Any))
                    }else{
                        failure(self.transactionFailPleaseContactForMoreInformation)
                    }
                    
                    break
                case .failure(let error):
                    if error._code == NSURLErrorTimedOut {
                        failure("false")
                    }else{
                        failure("false")
                    }
                    break
                }
        }
    }
    
}






