//
//  SucessTxnBillViewController.swift
//  iOSSampleApp
//
//  Created by kimseak on 12/7/19.
//  Copyright © 2019 seak. All rights reserved.
//

import UIKit

class SucessTxnBillViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableViewHeader: UITableViewCell!
    @IBOutlet weak var tableView: UITableView!
    let review =   ReviewTxnBillPayment()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var whiteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupProperties()
    }


    func setupTable(){
        tableView.dataSource = self
           tableView.tableHeaderView = tableViewHeader
           tableView.tableFooterView = UIView()
       tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
    }
        func setupProperties(){
            imageView.layer.cornerRadius = 60/2
            imageView.clipsToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 1
            greenView.layer.cornerRadius = 5
            whiteView.layer.cornerRadius = 5
           
        }
            
        

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return review.data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
            let data = ReviewTxnModel(data: review.data[indexPath.row] as! NSDictionary)

//            cell.backgroundColor = .clear
            cell.titleLabel.text = data.title
            cell.detailLabel.text = data.value
            return cell
        }
}
