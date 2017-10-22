//
//  ViewController.swift
//  Plank
//
//  Created by zhangxi on 16/10/2017.
//  Copyright © 2017 zhangxi. All rights reserved.
//

import UIKit
import SnapKit
import UICircularProgressRing

class ViewController: UIViewController {
    
    
    
    let timer = PlankTimer()
    
    @IBOutlet weak var plankTimeLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    
    @IBOutlet var settingView: UIView!
    @IBOutlet var historyView: UIView!
    @IBOutlet var plankView: UIView!
    
    @IBOutlet weak var backgroundCenter: NSLayoutConstraint!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    var ring : UICircularProgressRingView!
    
    @IBAction func start(_ sender: UIButton) {

        
        
        ring.setProgress(value: 25, animationDuration: 5) {
            print("down")
        }
    }
    
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
        
        
        
        
         ring = UICircularProgressRingView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
         ring.maxValue = 50
         ring.innerRingColor = UIColor.blue
            plankView.addSubview(ring)
 
        self.view.addSubview(plankView)
        
        
        
        
        self.plankTimeLabel.text = String(format:"%d秒",timer.plankDuration)
        self.restTimeLabel.text = String(format:"%d秒",timer.restDuration)

    }


}


//MARK: - 设置
extension ViewController
{
    @IBAction func changePlankTime(_ sender: UIButton) {
        print("changePlankTime")
        
        let a = (sender.tag == 1) ? -1 : 1
        timer.plankDuration += a
        self.plankTimeLabel.text = String(format:"%d秒",timer.plankDuration)
        
    }
    @IBAction func changeRestTime(_ sender: UIButton) {
        print("changeRestTime")
        let a = (sender.tag == 1) ? -1 : 1
        timer.restDuration += a
        self.restTimeLabel.text = String(format:"%d秒",timer.restDuration)
    }
}
//MARK: - 历史
extension ViewController
{
    
}






