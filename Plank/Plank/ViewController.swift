//
//  ViewController.swift
//  Plank
//
//  Created by zhangxi on 16/10/2017.
//  Copyright © 2017 zhangxi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    

    @IBOutlet weak var backgroundCenter: NSLayoutConstraint!
    @IBOutlet weak var setButton: UIButton!
    
    
    @IBAction func set(_ sender: UIButton)
    {
        
        if sender.isSelected
        {
            showHome()
        }else
        {
            showSet()
        }
        sender.isSelected = !sender.isSelected
    }
    
    
    func showSet()
    {
        UIView.animate(withDuration: 0.4) {
            
            self.backgroundCenter.constant = 60
            self.setButton.leftConstraint?.constant = self.view.frame.size.width - self.setButton.frame.size.width - 20
            self.view.layoutIfNeeded()
        }
    }
    func showHome()
    {
        UIView.animate(withDuration: 0.4) {
            
            self.backgroundCenter.constant = 0
            self.setButton.leftConstraint?.constant = 20
            self.view.layoutIfNeeded()
        }
    }
    func showHistory()
    {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}


