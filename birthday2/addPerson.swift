//
//  TestAddPerson.swift
//  birthday2
//
//  Created by 栗崎一真 on 2020/04/12.
//  Copyright © 2020 栗崎一真. All rights reserved.
//

import Foundation
import UIKit
// 人を追加する関数 テスト用
func testAddPerson(name: String, year: String?, month: String?, day: String?, present: String, memo: String){
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let newPerson = Person(name: name, year: year, month: month, day: day, present: present, memo: memo)
    appDelegate.DataBase.addPerson(person: newPerson)
}

// 人をまとめて追加する
func testAddPersons(language: String){
    if language == "japanese"{
    testAddPerson(name: "溝口 哲也", year: "1980", month: "1", day: "27", present: "a", memo: "")
    testAddPerson(name: "斎藤 明美", year: "1998", month: "2", day: "14", present: "", memo: "")
    testAddPerson(name: "田中 麗美", year: "1999", month: "2", day: "18", present: "", memo: "")
        testAddPerson(name: "鈴木 さおり", year: "2002", month: "2", day: "24", present: "ネックレス", memo: "家族みんなでお祝い")
    testAddPerson(name: "佐々木 愛理", year: "1980", month: "3", day: "10", present: "l", memo: "")
    testAddPerson(name: "黒崎 翠", year: "1993", month: "3", day: "11", present: "", memo: "")
    testAddPerson(name: "松本 あきら", year: "1970", month: "9", day: "20", present: "", memo: "")
    testAddPerson(name: "松本 あきら", year: "1970", month: "12", day: "20", present: "", memo: "")
    }
    if language == "english"{
     testAddPerson(name: "Scott G. West", year: "1980", month: "1", day: "27", present: "a", memo: "")
     testAddPerson(name: "Melissa N Wilson", year: "1998", month: "2", day: "14", present: "", memo: "")
     testAddPerson(name: "Casey Mc Shaw", year: "1999", month: "2", day: "18", present: "", memo: "")
     testAddPerson(name: "Shelly Lynne Stewart", year: "2002", month: "2", day: "24", present: "l", memo: "")
     testAddPerson(name: "Lee P. Martin", year: "1980", month: "3", day: "10", present: "l", memo: "")
     testAddPerson(name: "Rob K Peterson", year: "1993", month: "3", day: "11", present: "", memo: "")
     testAddPerson(name: "Victoria Gail Adam", year: "1970", month: "9", day: "20", present: "", memo: "")
    }
    
    if language == "chinese"{
     testAddPerson(name: "吴 浩然", year: "1980", month: "1", day: "27", present: "a", memo: "")
     testAddPerson(name: "周 梓睿", year: "1998", month: "2", day: "14", present: "", memo: "")
        testAddPerson(name: "黄 宇轩", year: "1999", month: "2", day: "18", present: "", memo: "")
        testAddPerson(name: "王 梓萱", year: "2002", month: "2", day: "24", present: "珠子", memo: "")
     testAddPerson(name: "杨 诗涵", year: "1980", month: "3", day: "10", present: "l", memo: "")
     testAddPerson(name: "陈 可馨", year: "1993", month: "3", day: "11", present: "", memo: "")
     testAddPerson(name: "李 雨萱", year: "1970", month: "9", day: "20", present: "", memo: "")
    }
    //Indonessia
    if language == "indonessia"{
     testAddPerson(name: "Damini", year: "1980", month: "1", day: "27", present: "a", memo: "")
     testAddPerson(name: "Elis", year: "1998", month: "2", day: "14", present: "", memo: "")
     testAddPerson(name: "Kuristin", year: "1999", month: "2", day: "18", present: "", memo: "")
        testAddPerson(name: "Suli", year: "2002", month: "2", day: "24", present: "a", memo: "")
     testAddPerson(name: "Agus", year: "1980", month: "3", day: "10", present: "l", memo: "")
     testAddPerson(name: "Askan", year: "1993", month: "3", day: "11", present: "", memo: "")
     testAddPerson(name: "Rasito", year: "1970", month: "9", day: "20", present: "", memo: "")
    }
}

//　通知のテストのために人を追加
func addPersonForNotificationTest(number: Int, month: Int, day: Int){
    for i in 0 ..< number{
        testAddPerson(name: String(i), year: "2000", month: String(month), day: String(day), present: "", memo: "")
    }
}
// 月ごとに人を追加
func addPersonAllMonth(numberByMonth: Int){
    for month in 1 ..< 13{
        for i in 0 ..< numberByMonth{
            let day = String(i+1)
            let name = String(month) + "." + day
            testAddPerson(name: name, year: "2000", month: String(month), day: day, present: "", memo: "")
        }
    }
}
