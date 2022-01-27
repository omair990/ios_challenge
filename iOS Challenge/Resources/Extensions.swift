//
//  Extensions.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//

import Foundation
import UIKit
import Kingfisher

extension String{
    
    func encodedStringForUrl() -> String {
        let string = self
        return string.addingPercentEncoding( withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String{
        return String(describing: self)
    }
}


extension UIImageView {
    
    func setImage(strImg : String,isFrom:String = "") {
        self.kf.indicatorType = .activity
        if let url = URL(string: strImg) {
            //self.kf.setImage(with: url)
            if isFrom == "Labor"{
                self.contentMode = .scaleAspectFill
                self.kf.setImage(with: url, placeholder: UIImage(named: "appIcon"))
            }
            else {
            self.kf.setImage(with: url, placeholder: UIImage(named: "appIcon"))
             
            }
            
        }
    }
}
    

extension Array {
    func isValidIndex(_ index : Int) -> Bool {
        return index < self.count
    }
}


extension UIViewController{
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    class var storyboardID: String {
        return "\(self)"
    }

}
