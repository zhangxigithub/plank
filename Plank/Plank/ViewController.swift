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
    

    @IBOutlet weak var setButton: UIButton!
    
    
    @IBAction func set(_ sender: UIButton)
    {
        
        //sender.snp.removeConstraints()
        UIView.animate(withDuration: 0.5) {
            
            sender.snp.makeConstraints({ (make) in
                make.right.equalTo(self.view)
                make.bottom.equalTo(self.view)
            })
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

