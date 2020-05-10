//
//  AppDelegate.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/05/07.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var DataBase = PersonModel() //データモデル
    var prm = SettingPrm()
    //var contact = ContactInfo() //連絡先

//通知メゾットを作成し、何日前通知を実現する
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //パーソンデータの読み込み
        if loadData() == nil{
            DataBase.personDataBase = []
        }else{
            DataBase.personDataBase = loadData()!
            //print(DataBase.personDataBase)
        }
        
        //prmデータ読み込み
        if prm.loadData() == nil{
            self.prm.colorStyle  = "ocean" //デフォルト
            self.prm.notiTime = "00" //デフォルト
            
        }else{
            if(self.prm.colorStyle == nil){self.prm.colorStyle  = "ocean"} //デフォルト
            if(self.prm.notiTime == nil){self.prm.notiTime  = "00"} //デフォルト

            self.prm = prm.loadData()!
        }
        //通知デリゲート
        // 通知許可の取得
        UNUserNotificationCenter.current().requestAuthorization(
        options: [.alert, .sound, .badge]){
            (granted, _) in
            if granted{
                UNUserNotificationCenter.current().delegate = self
            }
        }
        //let center = UNUserNotificationCenter.current()
        //center.delegate = self as? UNUserNotificationCenterDelegate
        
        //広告
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
        // Initialize Google Mobile Ads SDK, application IDを設定
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        //GADMobileAds.configure(withApplicationID: "ca-app-pub-8067409271833468~3203870735")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

        // 通知をセット
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        let notificationList = generateNotificationList(prm: prm, database: DataBase.personDataBase)
        setNotificationFromList(notificatonList: notificationList)
        
        // 表示
        /*
        UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
            for notification in notifications {
                print(notification)
                print("======================")
            }
        }
 */
        // データを保存
        prm.saveData()
        DataBase.saveData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        

        }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        prm.saveData()
        DataBase.saveData()//アプリ終了時にデータを保存
    }


}

extension AppDelegate:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // アプリ起動中でもアラート&音で通知
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    

}

