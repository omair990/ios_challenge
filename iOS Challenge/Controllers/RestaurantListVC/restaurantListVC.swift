//
//  restaurantListVC.swift
//  iOS Challenge
//
//  Created by Muhammad Umair on 24/06/1443 AH.
//

import UIKit
import Foundation

class restaurantListVC: UIViewController {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupIntialiazation()
        setupTableView()
        self.fetchingRecords()
    }
    
    
    func setupIntialiazation(){
        self.title = "Restaurant List"
    }
    
    
    func setupTableView(){
        let nibList = UINib.init(nibName: restListViewCell.reuseIdentifier, bundle: nil)
        self.tblView.register(nibList, forCellReuseIdentifier: restListViewCell.reuseIdentifier)
        
        self.tblView.delegate = self
        self.tblView.dataSource = self
        
    }
    
    @IBAction func btnBackTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func btnFilterTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            
            let vc = FilterVC.instantiate(fromAppStoryboard: .main)
            
            vc.completion = { model in
                
                if model == "DISTANCE"{
                    
                    
                    restaurantListModel.restaurantListModelArray  =  restaurantListModel.restaurantListModelArray.sorted {
                        $0.distance < $1.distance
                    }
                    
                }
                else if model == "OFFER"{
                    
                    restaurantListModel.restaurantListModelArray  =     restaurantListModel.restaurantListModelArray.sorted {
                        $0.offer < $1.offer
                    }
                    
                }
                
                else if model == "RATING"{
                    
                    restaurantListModel.restaurantListModelArray  =     restaurantListModel.restaurantListModelArray.sorted{
                        $0.rating < $1.rating
                    }
                    
                }
                
                
                self.tblView.reloadData()
                
            }
            
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: false, completion: nil)
        }
        
    }
    
    
    
    
    
    
}

//TableView
extension restaurantListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //-----------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return restaurantListModel.restaurantListModelArray.count
    }
    
    //-----------------------------------------------------------
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row  = indexPath.row
        
        let cell = tblView.dequeueReusableCell(withIdentifier: restListViewCell.reuseIdentifier, for: indexPath) as! restListViewCell
        
        
        if restaurantListModel.restaurantListModelArray.isValidIndex(row){
            let data  = restaurantListModel.restaurantListModelArray[row]
            cell.setCellData(data: data)
            
        }
        return cell
    }
    
    //-----------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row  = indexPath.row
        
        
        
        let vc = restautrantDetailVC.instantiate(fromAppStoryboard: .main)
        vc.rest_data =  restaurantListModel.restaurantListModelArray[row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
    }
    
    
    //-----------------------------------------------------------
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView().estimatedRowHeight
    }
    
    
    
}

//Network Request
extension restaurantListVC{
    
    
    func fetchingRecords(){
        challengeNetwork.restaurantList(completion:{ [weak weakSelf = self] (completion) in
            DispatchQueue.main.async {
                if completion == "true"{
                    self.tblView.reloadData()
                }
                else {
                    print("Something Wrong")
                }
            }
            
        })
    }
    
    
}
