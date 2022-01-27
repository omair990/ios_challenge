//
//  challengeURL.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//

import Foundation

let BASE_URL :String =  "https://jahez-other-oniiphi8.s3.eu-central-1.amazonaws.com"

class challengeURL {
    

    
    class func restaurantListURL()->URL
       {
           let url = (BASE_URL+"/restaurants.json").encodedStringForUrl()
           return  URL(string: url)!
       }
    
    
    
    
    
    
   
}
