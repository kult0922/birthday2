//
//  ViewController.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/05/07.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//
import UIKit
import UserNotifications
import GoogleMobileAds
class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var indexSection :Int?
    var indexRow : Int?
    var EditFlag = true
    var selectedIndex : Int?
    // 表示用リスト
    var viewList:Array<Array<Person>> = [[],[],[],[],[],[],[],[],[],[],[],[]]
    // 誕生日あがある月番号を格納 ex [1, 4, 11] 2月, 5月, 12月に誕生日あり
    var sectionNum:Array<Int>?
    
    let SectionList = [NSLocalizedString("Jan.", comment: ""),NSLocalizedString("Feb.", comment: ""),NSLocalizedString("Mar.", comment: ""),NSLocalizedString("Apr.", comment: ""),NSLocalizedString("May.", comment: ""),NSLocalizedString("Jun.", comment: ""),NSLocalizedString("Jul.", comment: ""),NSLocalizedString("Aug.", comment: ""),NSLocalizedString("Sep.", comment: ""),NSLocalizedString("Oct.", comment: ""),NSLocalizedString("Nov.", comment: ""),NSLocalizedString("Dec.", comment: "")]
 

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self //delegateをセット
        tableView.dataSource = self
        
        setAdmobBanner(controller: self)

        // ここでテスト
        #if DEBUG
            print("debug")
            addPersonAllMonth(numberByMonth: 1)
        #else
            print("release")
        #endif


    }
    
    override func viewDidAppear(_ animated: Bool) {//viewcontrollerの画面にきた時に実行
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.black
        ]


        super.viewDidAppear(animated)

        //monthにコピー
        self.viewList = appDelegate.DataBase.generateMonthDataList_c()
        print(viewList)
        print(sectionNum)
        

        tableView.reloadData() //tableviewを更新
    }
    
    //セクションの設定
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {


        let label : UILabel = UILabel()
        //label.backgroundColor = UIColor.gray
        label.textColor = UIColor.white
        
        switch appDelegate.prm.colorStyle {
        case "ocean":
            label.backgroundColor = UIColor(named: "Ocean1")
        case "forest":
            label.backgroundColor = UIColor(named: "Forest1")
        case "maple":
            label.backgroundColor = UIColor(named: "Maple1")
        default:
            label.backgroundColor = UIColor(named: "Ocean1")
        }

        label.text = SectionList[viewList[sectionNum![section]][0].dateComps.month! - 1]
        
        return label
    }
    
    //セクションの数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionNum = []
        
        for i in 0..<12{
            if(self.viewList[i].count != 0){
                sectionNum?.append(i)
            }
        }
        return sectionNum!.count
    }
    
    //行数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewList[sectionNum![section]].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルをセット
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell") as! CustomTableViewCell

        let personData = self.viewList[sectionNum![indexPath.section]][indexPath.row]
        
        let leftDay = calcLeftDays(targetDate: personData.dateComps)
        let more = makeMoreText(leftDay: leftDay)
        let dayText = number2dayText(day: personData.dateComps.day)
        let age = calcAge(birthDate: personData.dateComps)

        cell.setCell(name: personData.name!, day: dayText,
                     age: age, more: more, indexPath: indexPath,
                     present:personData.present)
        
        // 誕生日の人の背景色を変える
        if leftDay == 0{
            cell.contentView.backgroundColor = getColor(prm: appDelegate.prm, index: 3)
        }
        
        return cell
    }
    
    //cellが選択された時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSection = sectionNum![indexPath.section]
        indexRow = indexPath.row
        selectedIndex = viewList[sectionNum![indexPath.section]][indexPath.row].index
        if (indexSection != nil){
        performSegue(withIdentifier: "toEdit",sender: nil)
        }
    }
    
    //削除の処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            appDelegate.DataBase.personDataBase.remove(at: self.viewList[sectionNum![indexPath.section]][indexPath.row].index! )

            // 更新
            self.viewList = appDelegate.DataBase.generateMonthDataList_c()
            tableView.reloadData()
            
        }
    }
    
    //セグエの値渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "toEdit") {
            let EnterEditController = segue.destination as! EnterEditController
            EnterEditController.indexSection = indexSection
            EnterEditController.indexRow = indexRow
            EnterEditController.editFlag = true
            EnterEditController.selectedIndex = selectedIndex
        }
    }
    

}
