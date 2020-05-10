//
//  HelpTableViewController.swift
//  birthday2
//
//  Created by 栗崎一真 on 2019/03/12.
//  Copyright © 2019 栗崎一真. All rights reserved.
//
import GoogleMobileAds
import UIKit

class HelpTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let helpTitleList = [NSLocalizedString("helpTitle_1", comment: ""),NSLocalizedString("helpTitle_2", comment: "")]
    
    let helpTextList = [NSLocalizedString("helpText_1", comment: ""),NSLocalizedString("helpText_2", comment: "")]
    
    override func viewDidLoad() {
        setAdmobBanner(controller: self)
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return helpTitleList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
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
        
        label.text = helpTitleList[section]
        
        return label
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "HelpCell2") as! CustomHelpTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HelpCell1") as! CustomHelpTableViewCell
            cell.setCell(text: helpTextList[indexPath.section])
            return cell
        }
        
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
