import Foundation
import UserNotifications

func setNotificationFromList(notificatonList: ArraySlice<[String:Any]>){
    for notification in notificatonList{
        setNotification(date: notification["date"] as! DateComponents, title: notification["title"] as! String, body: notification["body"] as! String, id: notification["id"] as! String)
    }
    
}

// prm, persondatabase -> [name, title, body, id, dateComp]
func generateNotificationList(prm: SettingPrm, database: Array<Person>) -> ArraySlice<[String : Any]>{

    var candidate:[[String:Any]] = []
    for (i, person) in database.enumerated(){
        
        if prm.NFzero!{
            //　通知内容をセット
            let title = NSString.localizedUserNotificationString(forKey: "happyBirthday!", arguments: nil)
            let body = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("Happy Birthday", comment: ""), person.name!), arguments: nil)
            
            // 通知日をセット
            let notificationHour = getNotificationHour(prm: prm)
            let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 0, hour: notificationHour)
            // 通知情報をまとめる
            let notificationDict: [String: Any] = ["name": person.name!, "title": title, "body": body, "id": String(i) + "zero", "date": notificationDate]
            
            candidate.append(notificationDict)
        }
        
        if prm.NFone!{
            //　通知内容をセット
            let title = NSString.localizedUserNotificationString(forKey: "birthday coming soon", arguments: nil)
            let body = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("one days ago", comment: ""), person.name!), arguments: nil)

            // 通知日をセット
            let notificationHour = getNotificationHour(prm: prm)
            let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 1, hour: notificationHour)
            // 通知情報をまとめる
            let notificationDict: [String: Any] = ["name": person.name!, "title": title, "body": body, "id": String(i) + "one", "date": notificationDate]
            
            candidate.append(notificationDict)
        }
        
        if prm.NFtwo!{
            //　通知内容をセット
            let title = NSString.localizedUserNotificationString(forKey: "birthday coming soon", arguments: nil)
            let body = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("two days ago", comment: ""), person.name!), arguments: nil)
            
            // 通知日をセット
            let notificationHour = getNotificationHour(prm: prm)
            let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 2, hour: notificationHour)
            // 通知情報をまとめる
            let notificationDict: [String: Any] = ["name": person.name!, "title": title, "body": body, "id": String(i) + "two", "date": notificationDate]
            
            candidate.append(notificationDict)
        }
        
        if prm.NFthree!{
            //　通知内容をセット
            let title = NSString.localizedUserNotificationString(forKey: "birthday coming soon", arguments: nil)
            let body = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("three days ago", comment: ""), person.name!), arguments: nil)
            
            // 通知日をセット
            let notificationHour = getNotificationHour(prm: prm)
            let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 3, hour: notificationHour)
            // 通知情報をまとめる
            let notificationDict: [String: Any] = ["name": person.name!, "title": title, "body": body, "id": String(i) + "three", "date": notificationDate]
            
            candidate.append(notificationDict)
        }
        
        if prm.NFseven!{
            //　通知内容をセット
            let title = NSString.localizedUserNotificationString(forKey: "birthday coming soon", arguments: nil)
            let body = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("seven days ago", comment: ""), person.name!), arguments: nil)
            
            // 通知日をセット
            let notificationHour = getNotificationHour(prm: prm)
            let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 7, hour: notificationHour)
            // 通知情報をまとめる
            let notificationDict: [String: Any] = ["name": person.name!, "title": title, "body": body, "id": String(i) + "seven", "date": notificationDate]
            candidate.append(notificationDict)
        }
    }
    // 候補を並び替える
    candidate.sort {calcLeftDays(targetDate: $0["date"] as? DateComponents) < calcLeftDays(targetDate: $1["date"] as? DateComponents)}
    // 直近64を抽出
    return candidate.prefix(60)
}
// 通知パラメータとパーソンデータを受け取って通知を登録するメゾット
func setPersonNotification(prm: SettingPrm, person: Person, personId: String){
    let notificationHour = getNotificationHour(prm: prm)
    // 当日通知
    if(prm.NFzero!){
        // 通知日をセット
        let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 0, hour: notificationHour)

        //　通知内容をセット
        let notificationTitle = NSString.localizedUserNotificationString(forKey: "happyBirthday!", arguments: nil)
        let notificationBody = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("Happy Birthday", comment: ""), person.name!), arguments: nil)
        // 通知をセット
        setNotification(date: notificationDate, title: notificationTitle, body: notificationBody, id: personId + "zero")
    }
    // 前日通知
    if(prm.NFone!){
        // 通知日をセット
        let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 1, hour: notificationHour)
        
        //　通知内容をセット
        let notificationTitle = NSString.localizedUserNotificationString(forKey: "birthday coming soon", arguments: nil)
        let notificationBody = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("one days ago", comment: ""), person.name!), arguments: nil)
        // 通知をセット
        setNotification(date: notificationDate, title: notificationTitle, body: notificationBody, id: personId + "one")
    }
    
    // 2日前通知
    if(prm.NFtwo!){
        // 通知日をセット
        let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 2, hour: notificationHour)
        
        //　通知内容をセット
        let notificationTitle = NSString.localizedUserNotificationString(forKey: "birthday coming soon", arguments: nil)
        let notificationBody = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("two days ago", comment: ""), person.name!), arguments: nil)
        // 通知をセット
        setNotification(date: notificationDate, title: notificationTitle, body: notificationBody, id: personId + "two")
    }
    
    // 3日前通知
    if(prm.NFthree!){
        // 通知日をセット
        let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 3, hour: notificationHour)
        
        //　通知内容をセット
        let notificationTitle = NSString.localizedUserNotificationString(forKey: "birthday coming soon", arguments: nil)
        let notificationBody = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("three days ago", comment: ""), person.name!), arguments: nil)
        // 通知をセット
        setNotification(date: notificationDate, title: notificationTitle, body: notificationBody, id: personId + "three")
    }
    
    // 7日前通知
    if(prm.NFthree!){
        // 通知日をセット
        let notificationDate = calcNotificationDateComp(birthdayDateComp: person.dateComps, waitday: 7, hour: notificationHour)
        
        //　通知内容をセット
        let notificationTitle = NSString.localizedUserNotificationString(forKey: "birthday coming soon", arguments: nil)
        let notificationBody = NSString.localizedUserNotificationString(forKey: String(format: NSLocalizedString("seven days ago", comment: ""), person.name!), arguments: nil)
        // 通知をセット
        setNotification(date: notificationDate, title: notificationTitle, body: notificationBody, id: personId + "seven")
    }

}

// 通知日時，通知タイトル，本文，ID を受け取って通知をセット
func setNotification(date: DateComponents, title: String, body: String, id: String){
    // 通知文をセット
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    // 通知の音楽をセット
    content.sound = UNNotificationSound.default()
    //
    let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
    
    let calendarRequest = UNNotificationRequest(identifier: id, content: content,trigger: calendarTrigger)
    
    UNUserNotificationCenter.current().add(calendarRequest, withCompletionHandler: nil)

}

//　誕生日とwaitday, 通知時刻 から通知日時のDatecompを返す
func calcNotificationDateComp(birthdayDateComp: DateComponents, waitday: Int, hour: Int) -> DateComponents{
    
    //誕生日のdatecompsを生成(計算のため年は現在のものを使用)
    let nowdate = Date()
    var birthdayDateCompThisYear = Calendar.current.dateComponents(in: TimeZone.current, from: nowdate)
    // 年を今年に置き換えた誕生日datecomps
    birthdayDateCompThisYear.month = birthdayDateComp.month
    birthdayDateCompThisYear.day = birthdayDateComp.day
    // カレンダーをセット
    let calendar = Calendar(identifier: .gregorian)
    // 通知日を計算
    let notificationDate = calendar.date(byAdding: .day, value: -waitday, to: calendar.startOfDay(for: birthdayDateCompThisYear.date!))
    
    // datecompsに戻す
    let notificationDateComp =  Calendar.current.dateComponents(in: TimeZone.current, from: notificationDate!)
    
    
    // 年をnillにした通知日
    var notificationDateNillYear = DateComponents()
    notificationDateNillYear.month = notificationDateComp.month
    notificationDateNillYear.day = notificationDateComp.day
    // 時刻をセット(時刻は通知日によらず一定)
    notificationDateNillYear.hour = hour
    notificationDateNillYear.minute = 0

    return notificationDateNillYear
}


func getNotificationHour(prm: SettingPrm) -> Int{
    
    if prm.notiTime == "00"{
        return 0
    }
    if prm.notiTime == "06"{
        return 6
    }
    if prm.notiTime == "09"{
        return 9
    }
    if prm.notiTime == "12"{
        return 12
    }
    if prm.notiTime == "15"{
        return 15
    }
    if prm.notiTime == "18"{
        return 18
    }
    if prm.notiTime == "21"{
        return 21
    }
    
    //default
    return 0
}
