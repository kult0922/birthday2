//
//  calcDate.swift
//  birthday2
//
//  Created by 栗崎一真 on 2020/04/15.
//  Copyright © 2020 栗崎一真. All rights reserved.
//

import Foundation

// targetDateまでの残り日数を返す
func calcLeftDays(targetDate: DateComponents?) -> Int{
    // 現在の日時を取得
    let now = Date()
    // システムのカレンダーを取得
    let cal = Calendar.current
    // 現在時刻のDateComponentsを取り出す
    let nowComps = cal.dateComponents([.year, .month, .day], from: now)
    
    //誕生日の西暦を今にする
    var targetDateThisYear = DateComponents()
    targetDateThisYear.year = nowComps.year
    targetDateThisYear.month = targetDate?.month
    targetDateThisYear.day = targetDate?.day
    
    //誕生日あで後何日かを計算
    var comps = cal.dateComponents([.day], from: nowComps, to: targetDateThisYear)
    
    //もしマイナスになったら(今年の誕生日が終わっている)
    if(comps.day! < 0){
        //来年にして再計算
        targetDateThisYear.year = nowComps.year! + 1
        comps = cal.dateComponents([.day], from: nowComps, to: targetDateThisYear)
    }
    return comps.day!
}
// 生年から年齢を逆算
func calcAge(birthDate: DateComponents?) -> String{
    // 現在の日時を取得
    let now = Date()
    // システムのカレンダーを取得
    let cal = Calendar.current
    // 現在時刻のDateComponentsを取り出す
    let dateComps = cal.dateComponents([.year, .month, .day], from: now)
    var age: Int
    
    if(birthDate?.year == nil){
        return ""
    }else if((birthDate?.month!)! > dateComps.month!){
        age = dateComps.year! - (birthDate?.year!)! - 1
    }else if((birthDate?.month!)! == (dateComps.month!) && (birthDate?.day!)! > dateComps.day!){
        age = dateComps.year! - (birthDate?.year!)! - 1
    }else{
        age = dateComps.year! - (birthDate?.year!)!
    }
    
    return NSLocalizedString("age:", comment: "") + String(age) + NSLocalizedString("", comment: "歳が入る")
    
}

// 現在の月を返す
func getNowMonth() -> Int{
    // 現在の日時を取得
    let now = Date()
    // システムのカレンダーを取得
    let cal = Calendar.current
    // 現在時刻のDateComponentsを取り出す
    let dateComps = cal.dateComponents([.year, .month, .day], from: now)
    
    return dateComps.month!

}

func shiftMonth(index: Int, month: Int) -> Int{
    var shiftedIndex = index - month
    if shiftedIndex < 0{
        shiftedIndex = shiftedIndex + 12
    }
    return shiftedIndex
}
