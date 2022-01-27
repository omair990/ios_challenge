//
//  restaurantListModel.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//


import Foundation
import EVReflection

class  restaurantListModel: EVObject {
    
    var id : String = ""
    var name : String = ""
    var _description : String = ""
    var hours : String = ""
    var image : String = ""
    var rating : String = ""
    var distance : String = ""
    var hasOffer : Bool = false
    var offer : String = ""
    
    static var restaurantListModelArray : [restaurantListModel] = []
    
}
