//
//  restautrantDetailVC.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//

import UIKit

class restautrantDetailVC: UIViewController {
    
    
    @IBOutlet weak var imgRestaurant: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblHours: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    var rest_data = restaurantListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialMethod()
        setData()
    }
    
    func setupInitialMethod(){
        
        
        self.lblTitle.text = "Restaurant Detail"
    }
    
    func setData(){
        
        
        self.lblName.text = rest_data.name
        self.lblDescription.text = rest_data._description
        self.lblHours.text = rest_data.hours
        self.lblRating.text = rest_data.rating + "/Rating"
        self.imgRestaurant.setImage(strImg: rest_data.image)
        
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
}
