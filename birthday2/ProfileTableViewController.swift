//
//  SettingTableViewController.swift
//  birthday2
//
//  Created by 栗崎一真 on 2018/07/10.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit
import GoogleMobileAds
class ProfileTableViewController: UITableViewController {

    @IBOutlet weak var profileBackImage: UIImageView!
    @IBOutlet weak var ProfileName: UILabel!
    @IBOutlet weak var profileDate: UILabel!
    @IBOutlet weak var profilePresent: UILabel!
    
    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //画面遷移の時に渡される値
    var indexSection: Int?
    var indexRow: Int?
    var editFlag = true
    
    override func viewDidLoad() {
        //広告設定
        let AdMobID = "ca-app-pub-8067409271833468/2646317596"
        var admobView = GADBannerView()
        
        admobView = GADBannerView(adSize:kGADAdSizeBanner)
        admobView.frame.origin = CGPoint(x:0, y:self.view.frame.size.height - admobView.frame.height - 70)
        admobView.frame.size = CGSize(width:self.view.frame.width, height:admobView.frame.height)
        
        admobView.adUnitID = AdMobID
        
        admobView.rootViewController = self
        admobView.load(GADRequest())
        self.view.addSubview(admobView)
        
        super.viewDidLoad()
        
        profileBackImage.image = UIImage(named: "profile.png")
    
        
        profileDate.text = outYear(year: appDelegate.DataBase.personDataBase[appDelegate.DataBase.personDataBaseMonth[indexSection!][indexRow!].index!].dateComps.year)! + " / " + String(indexSection! + 1) + " / " + String(appDelegate.DataBase.personDataBase[appDelegate.DataBase.personDataBaseMonth[indexSection!][indexRow!].index!].dateComps.day!)
        ProfileName.text = appDelegate.DataBase.personDataBase[appDelegate.DataBase.personDataBaseMonth[indexSection!][indexRow!].index!].name
        profilePresent.text = appDelegate.DataBase.personDataBase[appDelegate.DataBase.personDataBaseMonth[indexSection!][indexRow!].index!].present
    }

    @IBAction func pressedEditButton(_ sender: Any) {
        performSegue(withIdentifier: "toEdit",sender: nil)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    //セグエの値渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if (segue.identifier == "toEdit") {
         let EnterEditController = segue.destination as! EnterEditController
         EnterEditController.indexSection = indexSection
         EnterEditController.indexRow = indexRow
         EnterEditController.editFlag = true
         }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
