//
//  CustomHelpTableViewCell.swift
//  birthday2
//
//  Created by 栗崎一真 on 2019/03/12.
//  Copyright © 2019 栗崎一真. All rights reserved.
//

import Foundation
//
//  CustomTableViewCell.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/05/15.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit

class CustomHelpTableViewCell: UITableViewCell {
    
    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet weak var aaaaa: UITextView!
    

    @IBAction func urlButton(_ sender: Any) {
        let url = URL(string: "https://twitter.com/kult56792979?lang=ja")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(text: String) {
        aaaaa.text = text
        
    }
}
