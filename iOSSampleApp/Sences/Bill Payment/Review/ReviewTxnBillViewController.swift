//
//  ReviewTxnBillViewController.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/6/19.
//  Copyright © 2019 seak. All rights reserved.
//

import UIKit

class ReviewTxnBillViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    // cell
    @IBOutlet var tableHeaderCell: UITableViewCell!
    
    
     let review =   ReviewTxnBillPayment()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperties()
        setupTable()
        
        
    }
    
    private func setupTable(){
        tableView.dataSource = self
        tableView.tableHeaderView = tableHeaderCell
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
    }
    
    private func setupProperties(){
        imageView.layer.cornerRadius = 60/2
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 5
                
    }
    
    @IBAction func submitToServer(_ sender: Any) {
        let vc = SucessTxnBillViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

extension ReviewTxnBillViewController: UITableViewDataSource {


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return review.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
        let data = ReviewTxnModel(data: review.data[indexPath.row] as! NSDictionary)

        cell.backgroundColor = .clear
        cell.titleLabel.text = data.title
        cell.detailLabel.text = data.value
        return cell
    }
    
}
