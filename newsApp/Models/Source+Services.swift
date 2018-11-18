//
//  Source+Services.swift
//  newsApp
//
//  Created by Pawan Kumar on 19/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class HttpClient: NSObject {
    static var sharedInstance: HttpClient = {
        HttpClient()
    }()
    
    func apiRequestCall(method: HTTPMethod, apiURL: String, completionHandler: @escaping (Bool,AnyObject?, NSError?) -> ()) {
        var encoding: ParameterEncoding = JSONEncoding.default
        if method == .get {
            encoding = URLEncoding.default
        }
        
        let apiURLString = apiURL + "?language=en&country=in&apiKey=" + "\(Constants.API_KEY)"
        
        debugPrint("apiURL: \(apiURLString)")
        
        Alamofire.request(apiURLString, method: method, parameters: nil, encoding: encoding, headers: nil)
            .responseJSON { response in
                
                debugPrint(response.result.value as Any)
                
                switch response.result {
                case .success:
                    var sourceList : [Sources] = []
                    if response.response?.statusCode == 200 {
//                        if response.result.value != nil {
//                            if let result = response.result.value as? Dictionary<String, AnyObject> {
//                                 if let result = result["sources"] as? [[String: Any]] {
//                                     sourceList = Mapper<Sources>().mapArray(JSONArray: result)
//                                     }
//
//                                 completionHandler(true, response.result.value as AnyObject, nil)
//                                 }
//                             completionHandler(true, response.result.value as AnyObject, nil)
//                        }
                         completionHandler(true, response.result.value as AnyObject, nil)
                        
                    } else if response.response?.statusCode == 400 {
                        // show server validation mesg
                        
                    } else { // session expire
                        let error = NSError(domain: "newsApp", code: 401, userInfo: nil)
                        completionHandler(false,nil, error)
                    }
                    
                    break
                case .failure:
                    if response.result.error != nil {
                        completionHandler(false,nil, response.result.error! as NSError)
                        debugPrint(response.result.error!)
                    }
                    break
                }
            }
    }
}
