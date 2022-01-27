//
//  challengeNetwork.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class challengeNetwork {
    

    
    class func restaurantList(completion: @escaping (String) -> Swift.Void)
    {
        let url = challengeURL.restaurantListURL()
      
        
        Alamofire.request(url, method:.get,encoding:JSONEncoding.default).responseJSON { (response) in
            
            switch response.result {
            case .success(let jsons):
                let jsondata = JSON(jsons)
                print(jsondata)
                challengeResponse.getSuccessResponse(json: jsondata)
                completion("true")
                break
                
            case .failure(let error):
                if let err = error as? URLError, err.code == .notConnectedToInternet , err.code == .networkConnectionLost , err.code == .cannotLoadFromNetwork
                {
                    completion("internet")
                } else
                {
                    completion("error")
                }
                break
            }
        }
    }
    
    
    
    
    
}
