//
//  Person.swift
//  birthday2
//
//  Created by 栗崎一真 on 2018/06/22.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import Foundation
import UserNotifications

class Person: NSObject, NSCoding{

    //カレンダー　グレゴリオ暦
    let cal = Calendar.current
    //date
    var dateComps = DateComponents()
    
    var name : String?
    var present : String?
    var memo : String?
    
    //databaseindex
    var index : Int?
    
    init(name: String, year: String?, month: String?, day: String?, present: String, memo: String) {
        self.name = name
        self.present = present
        self.memo = memo
        
        //生年月日
        self.dateComps.year = enterYear(year: year)
        self.dateComps.month = Int(month!)
        self.dateComps.day = Int(day!)
    }
    
    func encode(with aCoder: NSCoder) {
        if let name = name { aCoder.encode(name, forKey: "name") }
        if let present = present { aCoder.encode(present, forKey: "present") }
        if let index = index { aCoder.encode(index, forKey: "index") }
        if let memo = memo { aCoder.encode(memo, forKey: "memo") }
        aCoder.encode(dateComps, forKey: "dateComps")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.present = aDecoder.decodeObject(forKey: "present") as? String
        self.index = aDecoder.decodeObject(forKey: "index") as? Int
        self.dateComps = (aDecoder.decodeObject(forKey: "dateComps") as? DateComponents)!
        self.memo = aDecoder.decodeObject(forKey: "memo") as? String
    }
    
}
