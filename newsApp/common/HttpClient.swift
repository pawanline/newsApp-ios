//
//  HttpClient.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Alamofire
import Foundation
import ObjectMapper

class HttpClient: NSObject {
    static var sharedInstance: HttpClient = {
        HttpClient()
    }()
    
    func apiRequestCall(method: HTTPMethod, apiURL: String, completionHandler: @escaping (Bool, AnyObject?, NSError?) -> ()) {
        var encoding: ParameterEncoding = JSONEncoding.default
        if method == .get {
            encoding = URLEncoding.default
        }
        
        debugPrint("apiURL: \(apiURL)")
        
        Alamofire.request(apiURL, method: method, parameters: nil, encoding: encoding, headers: nil)
            .responseJSON { response in
                
                debugPrint(response.result.value as Any)
                
                switch response.result {
                case .success:
                    if response.response?.statusCode == 200 {
                        completionHandler(true, response.result.value as AnyObject, nil)
                        
                    } else if response.response?.statusCode == 400 {
                        // show server validation mesg
                        
                    } else { // session expire
                        let error = NSError(domain: "newsApp", code: 401, userInfo: nil)
                        completionHandler(false, nil, error)
                    }
                    
                    break
                case .failure:
                    if response.result.error != nil {
                        completionHandler(false, nil, response.result.error! as NSError)
                        debugPrint(response.result.error!)
                    }
                    break
                }
            }
    }
}
