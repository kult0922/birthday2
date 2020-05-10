//
//  AddController.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/05/07.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit

extension String {
    func isNumber() -> Bool {
        let pattern = "^[0-9]+$"
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return false }
        let matches = regex.matches(in: self, range: NSRange(location: 0, length: self.count))
        return matches.count > 0
    }
}


class AddController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{

//    @IBOutlet weak var EnterCell: UIView!
    
    

    //@IBOutlet weak var DateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //AgeTextFieldのキーボード設定
        //AgeTextField.returnKeyType = .done
        //AgeTextField.keyboardType = .numberPad
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
     
            //let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
     
            //let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
        
        return cell
    }
    
    
    @IBAction func AddPressed(_ sender: UIBarButtonItem) {
        /*
        if (textField.text != nil) && textField.text != "" {//textfieldが空もしくはnilでないなら
            //month_flagに月を代入
            month_flag = Int(MonthLabel.text!)! - 1

            //名前、日付を代入
            Person[0] = textField.text!
            Person[1] = DateLabel.text!
            
            //年齢を代入
            if (AgeTextField.text != nil) && textField.text != "" {
                Person[2] = AgeTextField.text!
            }
            
            //プレゼントを代入
            if (AgeTextField.text != nil) && textField.text != "" {
                Person[3] = PresentTextField.text!
            }
            
            //todolistに個人情報の配列を代入
            todoList[month_flag!].append(Person)
            
            
            //日付順にソート
            todoList[month_flag!].sort { Int($0[1])! < Int($1[1])! }
            
            //textfieldを空に
            textField.text = ""
            AgeTextField.text = ""
            PresentTextField.text = ""
            
            //textfieldの背景文字にadd moreを描画
            textField.placeholder = "Add more ?"
        }*/
    }
    
    }
