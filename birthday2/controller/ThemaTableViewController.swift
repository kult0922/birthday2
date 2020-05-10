//
//  ThemaTableViewController.swift
//  birthday2
//
//  Created by 栗崎一真 on 2018/07/10.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit
import GoogleMobileAds
class ThemaTableViewController: UITableViewController {
    
    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    let themaList = [NSLocalizedString("ocean", comment: ""),NSLocalizedString("forest", comment: ""),NSLocalizedString("maple", comment: "")]

    override func viewDidLoad() {
        setAdmobBanner(controller: self)

        super.viewDidLoad()
        tableView.allowsMultipleSelection = false
        tableView.tableFooterView = UIView(frame: .zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themaList.count
    }
    
    //cellが選択された時の処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let cell = tableView.cellForRow(at:indexPath)
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
        switch indexPath.row {
        case 0:
            appDelegate.prm.colorStyle = "ocean"
            print(0)
        case 1:
            appDelegate.prm.colorStyle = "forest"
            print(1)
        case 2:
            appDelegate.prm.colorStyle = "maple"
            print(2)
        default:
            appDelegate.prm.colorStyle = "ocean"
            print("default")
        }
        print(appDelegate.prm.colorStyle as Any)
        
        tableView.reloadData()
    }
    //選択が外れた時
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        // チェックマークを外す
        cell?.accessoryType = .none

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThemaCell", for: indexPath)
        cell.textLabel?.text = themaList[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        if(indexPath.row == 0 && appDelegate.prm.colorStyle == "ocean"){
            cell.accessoryType = .checkmark
        }else if(indexPath.row == 1 && appDelegate.prm.colorStyle == "forest"){
            cell.accessoryType = .checkmark
        }else if(indexPath.row == 2 && appDelegate.prm.colorStyle == "maple"){
            cell.accessoryType = .checkmark
        }else{
             cell.accessoryType = .none
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
