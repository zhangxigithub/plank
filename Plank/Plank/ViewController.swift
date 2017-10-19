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
    
    
    
    
    
    @IBOutlet weak var plankTimeLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    
    @IBOutlet var settingView: UIView!
    @IBOutlet var historyView: UIView!
    
    @IBOutlet weak var backgroundCenter: NSLayoutConstraint!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    
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
    
    @IBAction func history(_ sender: UIButton)
    {
        if sender.isSelected
        {
            showHome()
        }else
        {
            showHistory()
        }
        sender.isSelected = !sender.isSelected
    }
    
    func showSet()
    {
        UIView.animate(withDuration: 0.4) {
            self.historyButton.alpha = 0
            self.settingView.snp.updateConstraints{$0.right.equalTo(self.view.snp.left).offset(self.view.frame.size.width)}
            self.backgroundCenter.constant = 60
            self.setButton.leftConstraint?.constant = self.view.frame.size.width - self.setButton.frame.size.width - 20
            self.view.layoutIfNeeded()
        }
    }
    func showHome()
    {
        UIView.animate(withDuration: 0.4) {
            self.setButton.alpha = 1
            self.historyButton.alpha = 1
            self.settingView.snp.updateConstraints{ $0.right.equalTo(self.view.snp.left) }
            self.historyView.snp.updateConstraints{ $0.left.equalTo(self.view.snp.right) }
            self.backgroundCenter.constant = 0
            self.setButton.leftConstraint?.constant = 20
            self.historyButton.rightConstraint?.constant = 20
            self.view.layoutIfNeeded()
        }
    }
    func showHistory()
    {
        UIView.animate(withDuration: 0.4) {
            self.setButton.alpha = 0
            self.historyView.snp.updateConstraints{$0.left.equalTo(self.view.snp.right).offset(-self.view.frame.size.width)}
            self.backgroundCenter.constant = -60
            self.historyButton.rightConstraint?.constant = self.view.frame.size.width - self.setButton.frame.size.width - 20
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView.backgroundColor = UIColor.clear
        historyView.backgroundColor = UIColor.clear
        
        self.view.addSubview(settingView)
        self.view.addSubview(historyView)
        
        settingView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.width.equalTo(self.view)
            make.right.equalTo(self.view.snp.left)
        }
        historyView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.width.equalTo(self.view)
            make.left.equalTo(self.view.snp.right)
        }
        
        self.view.bringSubview(toFront: setButton)
        self.view.bringSubview(toFront: historyButton)

    }


}


//MARK: - 设置
extension ViewController
{
    @IBAction func changePlankTime(_ sender: UIButton) {
        print("changePlankTime")
    }
    @IBAction func changeRestTime(_ sender: UIButton) {
        print("changeRestTime")
    }
}
//MARK: - 历史
extension ViewController
{
    
}






