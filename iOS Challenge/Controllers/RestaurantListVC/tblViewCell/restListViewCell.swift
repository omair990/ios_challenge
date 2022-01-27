//
//  restListViewCell.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//

import UIKit

class restListViewCell: UITableViewCell {
    
    @IBOutlet weak var imgRest: UIImageView!
    @IBOutlet weak var lblRestName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(data:restaurantListModel){
        
        self.lblRestName.text = data.name
        self.imgRest.setImage(strImg: data.image)
        
        
    }
    
    
}
