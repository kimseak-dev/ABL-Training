//
//  ViewController.swift
//  iOSSampleApp
//
//  Created by ACLEDA on 12/2/19.
//  Copyright © 2019 seak. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let reuseIdentifier = "cell"
    var homeMenuList:Array<Any> = []
    
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionview.frame.width/3) - 3 , height: (collectionview.frame.width/3) - 3)
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        collectionview.collectionViewLayout = layout

        navigationController?.navigationBar.barStyle = .black
        homeMenuList = Tool.getMenus()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeMenuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CustomCollectionViewCell
        let menu = LocalMenu(data: homeMenuList[indexPath.row] as! NSDictionary)
        cell.imageView.image = UIImage(named: menu.icon)
        cell.titleLabel.text = menu.title
        return cell
      }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let menu = LocalMenu(data: homeMenuList[indexPath.row] as! NSDictionary)
        switch menu.menuCode  {
        case "BillsPayment":
            let vc = TxnBillViewController(nibName: "TxnBillViewController", bundle: Bundle.main)
            vc.navigationItem.title =  menu.title
            navigationController?.pushViewController(vc, animated: true)
        default: break
            
        }
    }
}




