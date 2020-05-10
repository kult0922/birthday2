//
//  SetiinngPrm.swift
//  birthday2
//
//  Created by 栗崎一真 on 2018/07/10.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import Foundation

class SettingPrm: NSObject,NSCoding {
    
     var colorStyle:String?
     var notiTime:String?
    
    //通知をいつするかの判定フラグ
    var notiFlag = [true, true, false, false, false]//使わない
    
    //通知の日指定フラグ
    var NFzero: Bool?
    var NFone: Bool?
    var NFtwo: Bool?
    var NFthree: Bool?
    var NFseven: Bool?
    
    override init() {
        //日
        if(NFzero == nil){NFzero = true}
        if(NFone == nil){NFone = true}
        if(NFtwo == nil){NFtwo = false}
        if(NFthree == nil){NFthree = false}
        if(NFseven == nil){NFseven = false}
       
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        if let colorStyle = colorStyle { aCoder.encode(colorStyle, forKey: "colorStyle") }
        if let notiTime = notiTime { aCoder.encode(notiTime, forKey: "notiTime") }
        //日
        aCoder.encode(notiFlag, forKey: "notiFlag")
        aCoder.encode(NFzero, forKey: "NFzero")
        aCoder.encode(NFone, forKey: "NFone")
        aCoder.encode(NFtwo, forKey: "NFtwo")
        aCoder.encode(NFthree, forKey: "NFthree")
        aCoder.encode(NFseven, forKey: "NFseven")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.colorStyle = aDecoder.decodeObject(forKey: "colorStyle") as? String
        self.notiTime = aDecoder.decodeObject(forKey: "notiTime") as? String
        
        self.notiFlag = ((aDecoder.decodeObject(forKey: "notiFlag") as? [Bool] ?? [true, true, false, false, false]))
        //日
        self.NFzero = aDecoder.decodeObject(forKey: "NFzero") as? Bool ?? true
        self.NFone = aDecoder.decodeObject(forKey: "NFone") as? Bool ?? true
        self.NFtwo = aDecoder.decodeObject(forKey: "NFtwo") as? Bool ?? false
        self.NFthree = aDecoder.decodeObject(forKey: "NFthree") as? Bool ?? false
        self.NFseven = aDecoder.decodeObject(forKey: "NFseven") as? Bool ?? false
        
    }
    
    //データ保存
    func saveData(){
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: self), forKey: "prm")
        
    }
    
    //保存されているデータを読み込む
    func loadData() -> SettingPrm?{
        if let loadedData = UserDefaults().data(forKey: "prm") {
            let prmObj = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! SettingPrm
            return prmObj
        }else {
            return nil
        }
    }
}
