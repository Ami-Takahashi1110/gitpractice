//
//  TaskViewController.swift
//  画面に入力したデータをDBへ保存、または保存せずに前画面に戻るクラス
//  MyTask
//
//  Created by USER on 2023/03/20.
//

import UIKit
import RealmSwift

class TaskViewController: UIViewController, UITextFieldDelegate {
    // UITextFieldDelegateプロトコルに準拠して、テキストフィールドのイベントを処理する
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 各テキストフィールドのデリゲートをselfに設定する
        titleTextField.delegate = self
        contentsTextField.delegate = self
        categoryTextField.delegate = self
        // リターンキーを処理するUITextFieldDelegateメソッド
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }

    // 保存ボタンのアクションメソッド
    // テキストフィールドに入力した値を保存する
    @IBAction func saveButton(_ sender: Any) {
        // Realmインスタンスを取得
        guard let realm = try? Realm() else {
            print("エラー：Realmインスタンスを取得できませんでした")
            return
        }
        // 新しいUserTableオブジェクトを作成して、プロパティを設定する
        let userTable = UserTable()
        userTable.date = datePicker.date
        userTable.title = titleTextField.text ?? ""
        userTable.contents = contentsTextField.text ?? ""
        userTable.category = categoryTextField.text ?? ""
        // Realmに新しいオブジェクトを書き込む
        do {
            try realm.write {
                realm.add(userTable)
            }
        } catch {
            print("エラー：Realmに書き込めませんでした")
        }
        
        // テキストフィールドをクリアする
        titleTextField.text = ""
        contentsTextField.text = ""
        categoryTextField.text = ""
        datePicker.date = Date()
    }
    
    // UITextFieldDelegateプロトコルのメソッドを実装
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    // 戻るボタンのアクションメソッド
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
