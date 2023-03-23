//
//  ViewController.swift
//  MyTask
//
//  Created by USER on 2023/03/20.
//

import UIKit
import RealmSwift

// p401~内容復習
class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {

    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // 検索ボタンをクリック時
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // キーボードを閉じる
        view.endEditing(true)
        
        if let searchWord = searchBar.text {
            // デバッグエリアに出力
            print(searchWord)
        }
    }
    
    // 配列taskArrayにUserTableで取得したデータを日付順に格納する
    var taskArray = try! Realm().objects(UserTable.self).sorted(byKeyPath: "date", ascending: true)
    // viewDidLoadメソッド ViewControllerがロードされた後に呼び出される
    // Viewが最初に表示される前に必要な初期化処理を行うために使用する
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Realmからデータを取得して、taskArrayに格納する
        taskArray = try! Realm().objects(UserTable.self).sorted(byKeyPath: "date", ascending: true)
        // Search Barのdelegate通知先を設定する
        searchText.delegate = self
        // 入力のヒントとなるプレースホルダを設定
        searchText.placeholder = "カテゴリのキーワードを入力"
        // Table ViewのdataSourceを設定
        tableView.dataSource = self
    }
    // realmのカテゴリー欄のデータを取得して合致しているかを判定する
    // tableView関数を使用してデータを表示
    // セルの総数を返すdatasourceメソッド（必ず記述する必要がある）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // リストの総数を返却
        return taskArray.count
    }
    
    // UITableViewCellを生成して返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UITableViewのセルなのでメモリを考慮して再利用する処理を記載
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // indexPath.rowでセルの位置を指定する
        let task = taskArray[indexPath.row]
        cell.textLabel?.text = task.category
        return cell
    }
}

