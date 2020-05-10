//
//  TableViewController.swift
//  todo4
//
//  Created by 栗崎一真 on 2018/06/06.
//  Copyright © 2018年 栗崎一真. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    //ObjecyLink
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var PresentTextField: UITextField!
    @IBOutlet weak var MemoTextView: UITextView!
    @IBOutlet weak var BirthdayTextField: UITextField!
    

    let BirthPickerView = UIPickerView()
    
    //日付のデータセット
    let list = [ ["1910","1911","1912","1913","1914","1915","1916","1917","1918","1919","1920","1921","1922","1923","1924","1925","1926","1927","1928","1929","1930","1931","1932","1933","1934","1935","1936","1937","1938","1939","1940","1941","1942","1943","1944","1945","1946","1947","1948","1949","1950","1951","1952","1953","1954","1955","1956","1957","1958","1959","1960","1961","1962","1963","1964","1965","1966","1967","1968","1969","1970","1971","1972","1973","1974","1975","1976","1977","1978","1979","1980","1981","1982","1983","1984","1985","1986","1987","1988","1989","1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","????","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020"],
    
        ["1","2","3","4","5","6","7","8","9","10","11","12"],
        
        ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15",
         "16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    ]
    
    let MonthList = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    
    
    //列数を返す
    func numberOfComponents(in MontnPickerview: UIPickerView) -> Int {
        return 3
    }
    //行数を返す
    func pickerView(_ BirthPickerview: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list[component].count
    }
    //要素を返す
    func pickerView(_ BirthPickerview: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        return list[component][row]
    }
    
    //選択された時の処理
    func pickerView(_ BirthPickerView: UIPickerView, didSelectRow row: Int,inComponent component: Int) {
        //コンポーネントごとにテキストフィールドに書き込み
        let year = self.pickerView(BirthPickerView, titleForRow: BirthPickerView.selectedRow(inComponent: 0), forComponent: 0)

        let month = self.pickerView(BirthPickerView, titleForRow: BirthPickerView.selectedRow(inComponent: 1), forComponent: 1)

        let day = self.pickerView(BirthPickerView, titleForRow: BirthPickerView.selectedRow(inComponent: 2), forComponent: 2)

        BirthdayTextField.text = makeBirthdayText(year:year!, month:month!, day:day!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BirthdayTextField.returnKeyType = .done
        BirthdayTextField.keyboardType = .numberPad

        //SettingPicker
        BirthPickerView.delegate = self
        // ピッカーの発火をセット
        BirthdayTextField.inputView = BirthPickerView

        //picker init
        BirthPickerView.selectRow(91, inComponent: 0, animated: true) //year
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //kebor change to numbers
       
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 3
        }
        if section == 1{
            return 1
        }
        return 1
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
