//
//  ViewController1.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/06/06.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit
import GoogleMobileAds

class EnterEditController: UIViewController{
    
    //編集対象のデータベースインデクス
    var selectedDatabaseIndex: Int?
    
    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var profile: TableViewController!
    
    //画面遷移の時に渡される値
    var indexSection: Int?
    var indexRow: Int?
    var selectedIndex: Int?
    var editFlag = false

    override func viewDidLoad() {
        print("EnterEdit Controller")
        // 背景色の設定
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemBackground
        } else {
            view.backgroundColor = UIColor.white
        }
        
        setAdmobBanner(controller: self)

        super.viewDidLoad()

        profile = self.childViewControllers[0] as! TableViewController
        
        //pickerview初期値設定
        if(editFlag){//編集モードのとき
            var year = "????"
            var month = "0"
            var day = "0"
            
            profile.NameTextField.text = appDelegate.DataBase.personDataBase[selectedIndex!].name
            profile.PresentTextField.text = appDelegate.DataBase.personDataBase[selectedIndex!].present
            profile.MemoTextView.text = appDelegate.DataBase.personDataBase[selectedIndex!].memo
            // 誕生日の代入
            let date = appDelegate.DataBase.personDataBase[selectedIndex!].dateComps
            day = String(date.day!)
            month = String(date.month!)
            year = outYear(year: date.year)!
            
            profile.BirthdayTextField.text = makeBirthdayText(year:year, month:month, day:day)
            /*
            for i in 0..<appDelegate.DataBase.personDataBase.count{
                if(appDelegate.DataBase.personDataBaseMonth[indexSection!][indexRow!].index == i){
                    selectedDatabaseIndex = i
                    
                    profile.NameTextField.text = appDelegate.DataBase.personDataBase[i].name
                    profile.PresentTextField.text = appDelegate.DataBase.personDataBase[i].present
                    profile.MemoTextView.text = appDelegate.DataBase.personDataBase[i].memo
                    // 誕生日の代入
                    let date = appDelegate.DataBase.personDataBase[i].dateComps
                    day = String(date.day!)
                    month = String(date.month!)
                    year = outYear(year: date.year)!
                    
                    profile.BirthdayTextField.text = makeBirthdayText(year:year, month:month, day:day)
                    
                    break
                }
            }
 */
            
            //picker初期値(入力されているものと同じになるようにする)
            if(year == "????"){ //生年不明の時
               profile.BirthPickerView.selectRow(0, inComponent: 0, animated: true)
            }else{
               profile.BirthPickerView.selectRow(calInitPickerYear(year: year) , inComponent: 0, animated: true)
            }
            profile.BirthPickerView.selectRow(Int(month)! - 1, inComponent: 1, animated: true)
            profile.BirthPickerView.selectRow(Int(day)! - 1 , inComponent: 2, animated: true)
 
        }
    }
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        if (checkEnter()){//ボタンが押された時に処理を実行する条件
            // このフラグは不要？？
            // month_flag = Int(profile.MonthTextField.text!)! - 1
            
            // picker の状態から日付を抽出
            let year = profile.pickerView(profile.BirthPickerView, titleForRow: profile.BirthPickerView.selectedRow(inComponent: 0), forComponent: 0)
            let month = profile.pickerView(profile.BirthPickerView, titleForRow: profile.BirthPickerView.selectedRow(inComponent: 1), forComponent: 1)
            let day = profile.pickerView(profile.BirthPickerView, titleForRow: profile.BirthPickerView.selectedRow(inComponent: 2), forComponent: 2)
            
            if(editFlag){
            //編集の時
                appDelegate.DataBase.editDatabase(
                    index: selectedIndex!,
                    name: profile.NameTextField.text!,
                    day: day!,
                    month: month!,
                    year: year!,
                    present: profile.PresentTextField.text!,
                    memo: profile.MemoTextView.text!)
            }else{
            //新規作成の時
                let newPerson = Person(
                    name: profile.NameTextField.text!,
                    year: year!,
                    month: month!,
                    day: day!,
                    present: profile.PresentTextField.text!,
                    memo: profile.MemoTextView.text!)
                
                appDelegate.DataBase.addPerson(person: newPerson)
            }
            
            //日付順にソート
            //personList[month_flag!].sort { $0.date! < $1.date! }
            //appDelegate.DataBase.sortPersonDataBase()
            
            for i in 0..<appDelegate.DataBase.personDataBase.count{
                print(appDelegate.DataBase.personDataBase[i].dateComps.month!, terminator: " ")
                print(appDelegate.DataBase.personDataBase[i].dateComps.day!, terminator: " ")
                print(appDelegate.DataBase.personDataBase[i].name!)
            }
            
            // 画面をリスト画面に戻す
            self.navigationController?.popToRootViewController(animated: true)

        }
    }
    
    func checkEnter() -> Bool{
        if (profile.NameTextField.text != nil && profile.NameTextField.text != "" && profile.BirthdayTextField .text != nil && profile.BirthdayTextField.text != "")
        {
        return true
        }else{
        return false
        }
    }
    
    func calInitPickerYear(year: String) -> Int{
        var picker_locate = Int(year)! - 1910
        if(Int(year)! > 2000){
            picker_locate += 1
        }
        return picker_locate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
