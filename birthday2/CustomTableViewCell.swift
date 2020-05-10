//
//  CustomTableViewCell.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/05/15.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var presentBoxImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var More: UILabel!
    @IBOutlet weak var ColorLine: UIView!
    
    let testLabel = UILabel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Textを中央寄せにする.
        testLabel.textAlignment = NSTextAlignment.center
        //Name.frame = CGRect(x:100, y:100, width:10, height:30)
        Name.adjustsFontSizeToFitWidth = true

    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        testLabel.frame = CGRect(x:300, y:200, width:160, height:30)
        testLabel.text = "Test"
        contentView.addSubview(testLabel)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        testLabel.frame = CGRect(x: 110, y: 0, width: frame.width - 100, height: frame.height)
        //Name.frame = CGRect(x:100, y:100, width:10, height:30)
    }

    func setCell(name: String, day: String, age: String, more: String, indexPath: IndexPath, present: String?) {
        Name.text = name
        Day.text = day
        Age.text = age
        More.text = more
        //addSubview(testLabel)
        //self.contentView.addSubview(testLabel)
        
        if(present != nil && present != ""){
        presentBoxImage.image = UIImage(named: "presentbox1.png")
        }else{
        presentBoxImage.image = nil
        }
        
        // セルの背景色指定
        if #available(iOS 13.0, *) { // ダークモードはiOS13から
            self.contentView.backgroundColor = UIColor.secondarySystemBackground
        } else {
            self.contentView.backgroundColor = UIColor.white
        }
        
        // 日付が書かれたカラーバーの色指定
        switch appDelegate.prm.colorStyle {
        case "ocean":
            ColorLine.backgroundColor = UIColor(named: "Ocean2")
        case "forest":
            ColorLine.backgroundColor = UIColor(named: "Forest2")
        case "maple":
            ColorLine.backgroundColor = UIColor(named: "Maple2")
        default:
            ColorLine.backgroundColor = UIColor(named: "Ocean2")
        }
        
    }
}
