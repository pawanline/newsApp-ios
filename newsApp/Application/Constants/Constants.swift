//
//  Constants.swift
//  newsApp
//
//  Created by Pawan Kumar on 18/11/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation

struct Constants {
    
    static let API_KEY : String = "571fa23760634feb8040a5b5d9aba6c3"
    
    struct APIServices {
        // Base URL
        static func apiURL(_ methodName:String) -> String {
            let BASE_URL = "https://newsapi.org/v2"
            return BASE_URL + "/" + methodName
        }
        
        
        /* Source */
        static let  sources = Constants.APIServices.apiURL("sources")
    }
    
}
