//
//  TxnBillViewController.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/3/19.
//  Copyright © 2019 seak. All rights reserved.
//

import UIKit

class TxnBillViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var okButton: UIButton!
    
    
    // textfeild
    @IBOutlet weak var fromTextField: UnderLineTextField!
    @IBOutlet weak var accountTextField: UnderLineTextField!
    @IBOutlet weak var paymentAmountTextField: UnderLineTextField!
    @IBOutlet weak var paymentTypeTextField: UnderLineTextField!
    
    // cell
    @IBOutlet var fromTableViewCell: UITableViewCell!
    @IBOutlet var accountTableViewCell: UITableViewCell!
    @IBOutlet var paymentAmountTableViewCell: UITableViewCell!
    @IBOutlet var paymentTypeCell: UITableViewCell!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        setupProperties()
        
    }
    
    private func setupProperties(){
        okButton.layer.cornerRadius = 5
        accountTextField.delegate = self
        
    }
    
    private func setupTable(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 90
        tableView.separatorStyle = .none
        
    
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
          case 0:
            return fromTableViewCell
        case 1:
            return accountTableViewCell
        case 2:
            return paymentAmountTableViewCell
        case 3:
            return paymentTypeCell
        default:
            return UITableViewCell()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        payment()
      
        
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case accountTextField:
            checkConsumer(consumer: accountTextField.text ?? "")
            break
        
        default:
            break
        }
    }
    
    
    public func checkConsumer(consumer: String) {
        let service = BillPaymentService()
        self.showSpinner(onView: self.view)
        service.checkConsumerlogin(consumerNumber: consumer, success: { (result) in
            self.removeSpinner()
        }) { (error) in
            self.removeSpinner()
            self.presentMsg(msg: error)
        }
    }
    
    public func payment() {
        let service = BillPaymentService()
        self.showSpinner(onView: self.view)
        service.payment(consumerNumber: accountTextField.text ?? "", success: { (result) in
            
            self.removeSpinner()
            let vc = ReviewTxnBillViewController(nibName: "ReviewTxnBillViewController", bundle: Bundle.main)
            self.navigationController?.pushViewController(vc, animated: true)
                  
        }) { (error) in
            self.removeSpinner()
            self.presentMsg(msg: error)
        }
    }

}
