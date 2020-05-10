import UIKit
import FSCalendar
import CalculateCalendarLogic
import GoogleMobileAds


class CalenderViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    
    
    @IBOutlet weak var birthdayText: UITextView!
    
    @IBOutlet weak var calender: FSCalendar!
    
    @IBOutlet weak var textView: UIView!
    
    @IBOutlet weak var listLabel: UILabel!

    //appdelegateの値を使えるようにする
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        setAdmobBanner(controller: self)

        super.viewDidLoad()
        // 見出しテキスト
        listLabel.text = NSLocalizedString("birthday people", comment: "")
        // 画面の背景色
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemBackground
        } else {
            view.backgroundColor = UIColor.white
        }
        // カレンダー背景色
        if #available(iOS 13.0, *) {
            calender.backgroundColor = UIColor.systemBackground
        } else {
            calender.backgroundColor = UIColor.white
        }
        //テキスト部分の背景色を設定
        if #available(iOS 13.0, *) {
            textView.backgroundColor = UIColor.secondarySystemBackground
        } else {
            textView.backgroundColor = UIColor.systemGray
        }
        textView.layer.cornerRadius = 20
        //textfield背景色
        birthdayText.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        //text初期化
        birthdayText.text = ""
        //テキストを編集できないように
        birthdayText.isEditable = false
        // デリゲートの設定
        //これを実行するとエラー
        //self.calendar.dataSource = self
        //self.calendar.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    // 祝日判定を行い結果を返すメソッド(True:祝日)
    func judgeHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        // 祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        
        // CalculateCalendarLogic()：祝日判定のインスタンスの生成
        let holiday = CalculateCalendarLogic()
        
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    
    // 誕生日判定を行い結果を返すメソッド(True:誕生日)
    func judgeBirthday(_ date : Date) -> Bool {
        //誕生日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        // 誕生日判定を行う日にちの月、日を取得
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        
        if (appDelegate.DataBase.personDataBaseMonth[month - 1].count > 0){//まず月で比較
            for i in 0..<appDelegate.DataBase.personDataBaseMonth[month - 1].count{//日で比較
                if (appDelegate.DataBase.personDataBaseMonth[month - 1][i].dateComps.day == day){
                return true
                }
            }
        }
        return false
    }
    
    // 日付から誕生日の人の名前を返す
    func nameBirthday(_ date : Date) -> [String] {
        //誕生日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        // 誕生日判定を行う日にちの月、日を取得
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        
        var birthdayNames:Array<String> = []
        if (appDelegate.DataBase.personDataBaseMonth[month - 1].count > 0){//まず月で比較
            for i in 0..<appDelegate.DataBase.personDataBaseMonth[month - 1].count{//日で比較
                if (appDelegate.DataBase.personDataBaseMonth[month - 1][i].dateComps.day == day){
                    birthdayNames.append(appDelegate.DataBase.personDataBaseMonth[month - 1][i].name!)
                }
            }
        }
        return birthdayNames
    }
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    //曜日判定(日曜日:1 〜 土曜日:7)
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }
    
    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする（祝日は赤色で表示する）
        if self.judgeHoliday(date){
            return UIColor.red
        }
        //土日の判定を行う（土曜日は青色、日曜日は赤色で表示する）
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {   //日曜日
            return UIColor.red
        }
        if weekday == 7 {  //土曜日
            return UIColor.blue
        }
        // 平日の色
        if #available(iOS 13.0, *) {
            return UIColor.label
        } else {
            return UIColor.black
        }
    }
    

    //タップされた日付を取得
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        //初期化
        birthdayText.text = ""
        let birthNames = nameBirthday(date)
        for i in 0..<birthNames.count{
        birthdayText.text?.append(birthNames[i])
        birthdayText.text?.append("\n")
        }
    }
    
    //画像をつける関数
    func calendar(_ calendar: FSCalendar!, imageFor date: Date!) -> UIImage! {
        let image = UIImage(named: "dateMark.png")
        if (self.judgeBirthday(date)){
            
            return image
        }else{
            return nil
        }

    }
    

    
}
