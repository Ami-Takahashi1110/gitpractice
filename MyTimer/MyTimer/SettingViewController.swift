//
//  SettingViewController.swift
//  MyTimer
//
//  Created by USER on 2022/10/22.
//

import UIKit

// UIPickerViewDataSourceとUIPickerViewDelegateはプロトコル
class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // UIPickerViewに表示するデータをArrayで作成
    let settingArray: [Int] = [10, 20, 30, 40, 50, 60]
    
    // 設定値を覚えるキーを設定
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // timerSettingPickerのデリゲートとデータソースの通知先を指定
        // なぜselfに格納するのか？→自分自身のインスタンスに格納するという意味でself
        // timerSettingPickerはIBOutletで既にインスタンス化されているのでインスタンスの設定をここで行う必要はない
        // viewDidLoad()の中で実行されることが多い
        // UIPickerViewDataSourceとUIPickerViewDelegateの中で定義された関数を自クラスで実装
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        // userDefaultsの取得
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        // Pickerの選択を合わせる
        // selectRowとselectedRowの違いは？
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
                
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    
    @IBAction func decisionButtonAction(_ sender: Any) {
        // 前画面に戻る
        _ = navigationController?.popViewController(animated: true)
    }
    
    // UIPickerViewの列数を設定
    // 列を数えるときにはcolumnなどの名称がコンポーネントにつかないので注意
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数を取得
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    
    // UIPickerViewの表示する内容を設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settingArray[row])
    }
    
    // picker選択時に実行
    // synchronizeを使用することでデータを永久に保持できないUserDefaultsメソッドがデータを保存できるようになる
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // UserDefaultsの設定（定型文）
        let settings = UserDefaults.standard
        settings.setValue(settingArray[row], forKey: settingKey)
        settings.synchronize()
    }
    
}
