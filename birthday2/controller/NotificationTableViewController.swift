//
//  NotificationTableViewController.swift
//  birthday2
//
//  Created by 栗崎一真 on 2018/10/21.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds
import UserNotifications

class NotificationTableViewController: UITableViewController {
    
    @IBOutlet weak var BarText: UINavigationItem!
    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    let notificationList = [[NSLocalizedString("that day", comment: ""),NSLocalizedString("previous day", comment: ""),NSLocalizedString("2 days ago", comment: ""),NSLocalizedString("3 days ago", comment: ""),NSLocalizedString("7 days ago", comment: "")],
                            ["00:00", "06:00", "09:00", "12:00", "15:00", "18:00", "21:00"]]
    
    let sectionList = [NSLocalizedString("noti_day", comment: ""), NSLocalizedString("noti_time", comment: "")]
    
    override func viewDidLoad() {

        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.red
        ]
        //現在の通知許可状態を確認
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, _) in
            if(granted){
                self.BarText.title = ""
            }else{
                self.BarText.title = NSLocalizedString("notiErrMessage", comment: "")
            }
        }

        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
        tableView.tableFooterView = UIView(frame: .zero)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return notificationList[section].count
        case 1:
            return notificationList[section].count
        default:
            return 0
        }
    }
    //セクションの設定
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
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
        
        label.text = sectionList[section]
        
        return label
    }
    
    //cellが選択された時の処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if(indexPath.section == 0){
            switch indexPath.row {
            case 0:
                appDelegate.prm.NFzero! = !(appDelegate.prm.NFzero!)
            case 1:
                appDelegate.prm.NFone = !(appDelegate.prm.NFone!)
            case 2:
                appDelegate.prm.NFtwo = !(appDelegate.prm.NFtwo!)
            case 3:
                appDelegate.prm.NFthree = !(appDelegate.prm.NFthree!)
            case 4:
                appDelegate.prm.NFseven = !(appDelegate.prm.NFseven!)
            default:
                print("default")
            }
        }
        
        if(indexPath.section == 1){
            switch indexPath.row {
            case 0:
                appDelegate.prm.notiTime = "00"
            case 1:
                appDelegate.prm.notiTime = "06"
            case 2:
                appDelegate.prm.notiTime = "09"
            case 3:
                appDelegate.prm.notiTime = "12"
            case 4:
                appDelegate.prm.notiTime = "15"
            case 5:
                appDelegate.prm.notiTime = "18"
            case 6:
                appDelegate.prm.notiTime = "21"
            default:
                print("default")
            }
        }
        
        tableView.reloadData()
    }
    //選択が外れた時
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        // チェックマークを外す
        if(indexPath.section == 1){
            cell?.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotiCell", for: indexPath)
        cell.textLabel?.text = notificationList[indexPath.section][indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        //パラメータに合わせてチェックマークをつける
          //dayの設定セクション
        if(indexPath.section == 0){
            if(indexPath.row == 0 && appDelegate.prm.NFzero!){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 1 && appDelegate.prm.NFone!){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 2 && appDelegate.prm.NFtwo!){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 3 && appDelegate.prm.NFthree!){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 4 && appDelegate.prm.NFseven!){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        
        //timeの設定セクション
        if(indexPath.section == 1){
            if(indexPath.row == 0 && appDelegate.prm.notiTime == "00"){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 1 && appDelegate.prm.notiTime == "06"){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 2 && appDelegate.prm.notiTime == "09"){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 3 && appDelegate.prm.notiTime == "12"){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 4 && appDelegate.prm.notiTime == "15"){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 5 && appDelegate.prm.notiTime == "18"){
                cell.accessoryType = .checkmark
            }else if(indexPath.row == 6 && appDelegate.prm.notiTime == "21"){
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
