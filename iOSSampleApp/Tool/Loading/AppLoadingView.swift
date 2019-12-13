//
//  ToanChetLoading.swift
//  ToanChet
//
//  Created by ACLEDA on 7/22/18.
//  Copyright © 2018 ACLEDA. All rights reserved.
//

import UIKit

class AppLoadingView: UIView {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    let nibName = "AppLoadingView" 
    var contentView: UIView!
    var timer: Timer?
    
    public override init(frame: CGRect) {
        // @desc: for use in code
        super.init(frame: frame)
        setupview()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        // @desc: for use in interface builder
        super.init(coder: aDecoder)
        setupview()
    }
    
    private func setupview() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        contentView.alpha = 0.0
        
    }
    
    // @desc: allow view to control itself
    public override func layoutSubviews() {
        // Rounded corners
        self.layoutIfNeeded()
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 0
        self.contentView.backgroundColor = UIColor.black.withAlphaComponent(0.0)
    }
    
    // @desc: set message
    public func config(message text: String) {
        self.messageLabel.text = text
    }
    
    public override func didMoveToSuperview() {
        // @desc: fade in when added to supervie, then add a timer to remove the view
        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        })
        //        { _ in
        //            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(3.0), target: self, selector: #selector(self.removeSelf), userInfo: nil, repeats: false)
        //        }
    }
    
    @objc public func removeSelf() {
        // @desc: animate removal of view
        UIView.animate(withDuration: 0.10, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            self.contentView.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
