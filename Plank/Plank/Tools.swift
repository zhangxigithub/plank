//
//  Tools.swift
//  Plank
//
//  Created by zhangxi on 18/10/2017.
//  Copyright © 2017 zhangxi. All rights reserved.
//

import UIKit

extension UIView
{
    var leftConstraint : NSLayoutConstraint?
    {
        for c in self.superview?.constraints ?? [NSLayoutConstraint]()
        {
            if c.firstAttribute == .leading || c.secondAttribute == .leading
            {
                return c
            }
        }
        return nil
    }
    var rightConstraint : NSLayoutConstraint?
    {
        for c in self.superview?.constraints ?? [NSLayoutConstraint]()
        {
            print(c)
            if c.firstAttribute == .trailing || c.secondAttribute == .trailing
            {
                return c
            }
        }
        return nil
    }
    
    func moveLeft(offset:CGFloat = 0)
    {
        self.rightConstraint?.isActive = false
        self.leftConstraint?.isActive = true
        self.leftConstraint?.constant = offset
        self.superview?.updateConstraints()
    }
    func moveRight(offset:CGFloat = 0)
    {
        self.leftConstraint?.isActive = false
        self.rightConstraint?.isActive = true
        self.rightConstraint?.constant = offset
        self.superview?.updateConstraints()
    }
}
