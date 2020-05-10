//
//  format.swift
//  birthday2
//
//  Created by 栗崎一真 on 2020/04/12.
//  Copyright © 2020 栗崎一真. All rights reserved.
//

import Foundation

func makeBirthdayText(year: String, month: String, day: String) -> String {
    
    let year_ext = NSLocalizedString("year_ext", comment: "")
    let month_ext = NSLocalizedString("month_ext", comment: "")
    let day_ext = NSLocalizedString("day_ext", comment: "")
    
    return year + year_ext + month + month_ext + day + day_ext
}
func makeMoreText(leftDay: Int) -> String{
    if leftDay == 0 {
       return NSLocalizedString("today_is_birthday", comment: "")
    }
    
    return String(format: NSLocalizedString("leftDay", comment: ""), leftDay)
}
// 特殊な日付の語尾をつける
func number2dayText(day: Int?) -> String{
    var th = "th"
    //特殊なケースの語尾
    if(day == 1 || day == 21 || day == 31){
        th = "st"
    }
    if(day == 2 || day == 22){
        th = "nd"
    }
    if(day == 3 || day == 23){
        th = "rd"
    }
    return String(day!) + String(format: NSLocalizedString("dayDisp", comment: ""), th)
}
