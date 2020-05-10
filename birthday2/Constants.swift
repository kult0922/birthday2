//
//  Constants.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/05/07.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//
/*
 
 <todo>
 インターフェイス改善
  - 色のスタイルが選択できるようにする　ok
  - 個人プロフィール画面をつくる ok
  - 設定画面をつくる ok
  - プレゼント表示 ok
  - 画面回転禁止
  - 一週間前の通知
  - 顔写真追加
*/

/*
 personDataBaseのindex更新(copymonth)が必要な時
 データ削除のとき
 */


import Foundation
import UserNotifications
//入力yearをunknownならnilにそうでなければintに
func enterYear(year: String?) -> Int?{
    if (year == "????"){
        return nil
    }else{
        return Int(year!)
    }
    
}

//nilなら????そうでなければstringに
func outYear(year: Int?) -> String?{
    if (year == nil){
        return "????"
    }else{
        return String(year!)
    }
}

var month_flag:Int?
var notificationIdentifier:Int?

//通知をいつするかの判定フラグ
//var notiFlag = [false,false,true] //当日、3日前、7日前

let notifiHour = 0
let notifiMinute = 59

//保存されているデータを読み込む
func loadData() -> [Person]?{
    if let loadedData = UserDefaults().data(forKey: "personDataBase") {
        let personObj = NSKeyedUnarchiver.unarchiveObject(with: loadedData) as! [Person]
        return personObj
    }else {
        return nil
    }
}


