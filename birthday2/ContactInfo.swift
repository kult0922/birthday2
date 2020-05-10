//
//  contactInfo.swift
//  birthday2
//
//  Created by 栗崎一真 on 2019/02/15.
//  Copyright © 2019 栗崎一真. All rights reserved.
//

/*
import Contacts
import UIKit

class ContactInfo {

    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    // 連絡帳アクセス可否状態を取得
    let status = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
    
    func permission(){

        switch (status) {
    
        // まだダイアログから選択を行っていない または　ペアレンタルコントロールや、機能制限によりアクセス不可
        case CNAuthorizationStatus.notDetermined,CNAuthorizationStatus.restricted:
    
        // このアプリが連絡先を使ってもいいかをユーザーが選択していない場合に、連絡先の使用を許可するか禁止するかを選択するメッセージボックスを表示
        // クロージャー内、循環参照によるメモリーリークに注意！
            let store = CNContactStore.init()
            store.requestAccess(for: CNEntityType.contacts, completionHandler: { (granted, Error) in
        
        // 利用可能
                if granted {
            
            // クロージャー内の処理なのでメッセージを表示する等、画面に関連する処理を行う場合はメインスレッドで処理を行うようにしましょう
                    DispatchQueue.main.async {
                    }
            
            // 利用不可能
                } else {
            
            // クロージャー内の処理なのでメッセージを表示する等、画面に関連する処理を行う場合はメインスレッドで処理を行うようにしましょう
                    DispatchQueue.main.async {
                    }
        }
    })
    
        // 拒否が選択されている
        case CNAuthorizationStatus.denied:
        break
        // 利用可能
        case CNAuthorizationStatus.authorized:
            
            // 連絡先を取得するクラスのインスタ巣を作成
            let store = CNContactStore.init()
            
            // 連絡帳の1つ1つのデータを収める空の配列 people を準備
            var people = [CNContact]()
            
            
            do {
                // 連絡先データベースからここでは苗字・名前・電話番号情報を取得
                try store.enumerateContacts(with: CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor, CNContactFamilyNameKey as CNKeyDescriptor,CNContactPhoneNumbersKey as CNKeyDescriptor, CNContactBirthdayKey as CNKeyDescriptor])) {
                    (contact, cursor) -> Void in
                    // 電話番号が保持されている連絡先だったら
                if (!contact.phoneNumbers.isEmpty){
                    // 取得したデータをpeople に収める
                    people.append(contact)
                    }
                }
            }
            catch{
                print("連絡先データの取得に失敗しました")
            }
            
            // peopleに取得した連絡先の数だけループ
            for humen in people{
                
                // 「電話：電話番号　名前：苗字 ま前」のフォーマットで連絡先データが出力される
                print("名前：\(humen.familyName) \(humen.givenName)")
                var year:String?
                var month:String?
                var day:String?
                
                if(humen.birthday?.year != nil){
                    year = String(humen.birthday!.year!)
                    print(year)
                }
                if(humen.birthday?.month != nil){
                    month = String(humen.birthday!.month!)
                    print(month)
                }
                if(humen.birthday?.day != nil){
                    day = String(humen.birthday!.day!)
                    print(day)
                }
                
                let newPerson = Person(name: humen.familyName + humen.givenName, year: year, month: month, day: day, present: "")
                
                appDelegate?.DataBase.addPerson(person: newPerson)

            }
        break
    
        }
    }
    
}
*/
