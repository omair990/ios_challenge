//
//  challengeResponse.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//

import Foundation
import SwiftyJSON

class challengeResponse{
    
    
    class func getSuccessResponse(json: JSON){
        
        restaurantListModel.restaurantListModelArray.removeAll()


        if let records = json.array
        {
            for rest in records
            {
                
                
                let restData =  restaurantListModel(json: rest.description)
                restaurantListModel.restaurantListModelArray.append(restData)

            }

            print("Done")

        }
        
        
        
    }
    
    class func getFailedResponse(Json: JSON){
        if Json["Message"].exists() {
            print("response someKey exists")
            
        }
    }
    
    
    
    
}

