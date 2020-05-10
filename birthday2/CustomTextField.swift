//
//  CustomTextField.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/06/20.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    // 入力カーソル非表示
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    // 範囲選択カーソル非表示
    override func selectionRects(for range: UITextRange) -> [Any] {
        return []
    }
    // コピー・ペースト・選択等のメニュー非表示
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }

}
