//
//  PersonModel.swift
//  birthday2
//
//  Created by 栗崎一真 on 2018/06/22.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import Foundation
import UserNotifications

class PersonModel: NSObject{
    
    //パーソンデータ格納配列
    var personDataBase:Array<Person> = []
    
    //月ごとのデータベース 13個目は誕生日未設定
    var personDataBaseMonth:Array<Array<Person>> = [[],[],[],[],[],[],[],[],[],[],[],[]]
    
    //データ追加メゾット
    func addPerson(person: Person){
        let newindex = personDataBase.count //新しいpersonデータが格納されるindexを取得
        self.personDataBase.append(person)
        personDataBase[newindex].index = newindex //新しいpersonのindexにデータが格納されたindexを代入

    }
    
    //データ編集メゾット
    func editDatabase(index: Int, name: String, day: String, month: String, year: String, present: String, memo: String){
        
        //プロパティを更新
        self.personDataBase[index].name = name
        self.personDataBase[index].dateComps.day = Int(day)
        self.personDataBase[index].dateComps.month = Int(month)
        self.personDataBase[index].dateComps.year = enterYear(year: year)
        self.personDataBase[index].present = present
        self.personDataBase[index].memo = memo
        
    }
    
    //データ削除メゾット
    func DeletePerson(index: Int){
        self.personDataBase.remove(at: index)
    }
    
    //personDataBaseMonthにコピーするメゾット
    func generateMonthDataList(){
        //初期化
        personDataBaseMonth = [[],[],[],[],[],[],[],[],[],[],[],[]]
        for i in 0..<personDataBase.count{
            if(personDataBase[i].dateComps.month == nil){
            }
            
            switch personDataBase[i].dateComps.month! - 1 {
            case 0:
                personDataBase[i].index = i//personDataBaseのindexを保持
                personDataBaseMonth[0].append(personDataBase[i])
            case 1:
                personDataBase[i].index = i
                personDataBaseMonth[1].append(personDataBase[i])
            case 2:
                personDataBase[i].index = i
                personDataBaseMonth[2].append(personDataBase[i])
            case 3:
                personDataBase[i].index = i
                personDataBaseMonth[3].append(personDataBase[i])
            case 4:
                personDataBase[i].index = i
                personDataBaseMonth[4].append(personDataBase[i])
            case 5:
                personDataBase[i].index = i
                personDataBaseMonth[5].append(personDataBase[i])
            case 6:
                personDataBase[i].index = i
                personDataBaseMonth[6].append(personDataBase[i])
            case 7:
                personDataBase[i].index = i
                personDataBaseMonth[7].append(personDataBase[i])
            case 8:
                personDataBase[i].index = i
                personDataBaseMonth[8].append(personDataBase[i])
            case 9:
                personDataBase[i].index = i
                personDataBaseMonth[9].append(personDataBase[i])
            case 10:
                personDataBase[i].index = i
                personDataBaseMonth[10].append(personDataBase[i])
            case 11:
                personDataBase[i].index = i
                personDataBaseMonth[11].append(personDataBase[i])
            default: break
            }
            
        }
    }
    
    func generateMonthDataList_b(){
        //初期化
        personDataBaseMonth = [[],[],[],[],[],[],[],[],[],[],[],[]]
        // 生成
        for i in 0..<self.personDataBase.count{
            self.personDataBase[i].index = i //personDataBaseのindexを保持
            self.personDataBaseMonth[personDataBase[i].dateComps.month! - 1].append(personDataBase[i])
        }
    }
    
    func generateMonthDataList_c() -> Array<Array<Person>>{
        //初期化
        var personDataSeparatedMonth:Array<Array<Person>> = [[],[],[],[],[],[],[],[],[],[],[],[]]
        for i in 0..<self.personDataBase.count{
            self.personDataBase[i].index = i  //personDataBaseのindexを保持
            
            var nowMonth = getNowMonth()
            nowMonth = 1
            
            let monthIndex = shiftMonth(index: self.personDataBase[i].dateComps.month! - 1, month: nowMonth - 1)

            personDataSeparatedMonth[monthIndex].append(self.personDataBase[i])
        }
        // ソート
        for i in 0..<personDataSeparatedMonth.count{
            personDataSeparatedMonth[i].sort{$0.dateComps.day! < $1.dateComps.day!}
        }
        
        
        return personDataSeparatedMonth
    }
    // personDataBaseを月日でソート
    // 現状使わない
    /*
    func sortPersonDataBase(){
        self.personDataBase.sort {$0.dateComps.month! < $1.dateComps.month!}
        self.personDataBase.sort {$0.dateComps.day! <= $1.dateComps.day! && $0.dateComps.month! <= $1.dateComps.month!}
    }
 */
    

    //prsonDataBaseMonthをソート
    func sortPersonDataBaseMonth(){
        for i in 0..<personDataBaseMonth.count{
            self.personDataBaseMonth[i].sort{$0.dateComps.day! < $1.dateComps.day!}
        }
    }
    
    //データ保存
    func saveData(){
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: personDataBase), forKey: "personDataBase")
    }
    // すべてのデータを削除
    func deleteAllPersonData(){
        personDataBase = []
    }
    
    //誕生日までの残り日数を計算
    func calLeftDays(birthDate: DateComponents?) -> Int{
        // 現在の日時を取得
        let now = Date()
        // システムのカレンダーを取得
        let cal = Calendar.current
        // 現在時刻のDateComponentsを取り出す
        let nowComps = cal.dateComponents([.year, .month, .day], from: now)
        
        //誕生日の西暦を今にする
        var nowBirth = birthDate
        nowBirth?.year = nowComps.year
        
        //誕生日あで後何日かを計算
        var comps = cal.dateComponents([.day], from: nowComps, to: nowBirth!)
        
        //もしマイナスになったら(今年の誕生日が終わっている)
        if(comps.day! < 0){
            //来年にして再計算
            nowBirth?.year = nowComps.year! + 1
            comps = cal.dateComponents([.day], from: nowComps, to: nowBirth!)
        }
        return comps.day!
    }
    
    
    func fetchData() -> [Person]? {
        if let database = UserDefaults.standard.array(forKey: "personDataBase") as? [Person] {//todoListをstring配列にキャストしてtodoに入れる
            return database //保存された文字列を配列として返す
        }
        else {
            return nil
        }
    }
    
}
