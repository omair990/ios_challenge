//
//  FilterVC.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//

import UIKit

class FilterVC: UIViewController {

    var completion: ((_ istag : String) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDistanceTappedAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.completion!("DISTANCE")
    }
    
    @IBAction func btnRatingTappedAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.completion!("RATING")
    }
    @IBAction func btnOfferTappedAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.completion!("OFFER")
    }
    

}
