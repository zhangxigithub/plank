//
//  PlankTimer.swift
//  Plank
//
//  Created by zhangxi on 19/10/2017.
//  Copyright © 2017 zhangxi. All rights reserved.
//

import Foundation



class PlankTimer
{
    var plankDuration : Int{
        set{
            UserDefaults.standard.set(newValue, forKey: "plankDuration")
        }
        get{
            if let value = UserDefaults.standard.object(forKey: "plankDuration") as? NSNumber
            {
                return value.intValue
            }else
            {
                return 30
            }
        }
    }
    var restDuration : Int{
        set{
            UserDefaults.standard.set(newValue, forKey: "restDuration")
        }
        get{
            if let value = UserDefaults.standard.object(forKey: "restDuration") as? NSNumber
            {
                return value.intValue
            }else
            {
                return 20
            }
        }
    }
}
