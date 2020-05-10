//
//  color.swift
//  birthday2
//
//  Created by 栗崎一真 on 2020/04/15.
//  Copyright © 2020 栗崎一真. All rights reserved.
//

import Foundation
import UIKit

func getColor(prm: SettingPrm, index: Int) -> UIColor{
    
    if prm.colorStyle == "ocean"{
        return UIColor(named: "Ocean" + String(index))!
    }
    if prm.colorStyle == "forest"{
        return UIColor(named: "Forest" + String(index))!
    }
    if prm.colorStyle == "maple"{
        return UIColor(named: "Maple" + String(index))!
    }
    
    return UIColor(named: "Ocean" + String(index))!

}
