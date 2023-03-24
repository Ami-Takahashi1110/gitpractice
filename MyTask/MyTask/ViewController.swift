//
//  ViewController.swift
//  検索バーに検索したいキーワードを入力して一覧表示するクラス
//  MyTask
//
//  Created by USER on 2023/03/20.
//

import UIKit
import RealmSwift

//
class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {

    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // Realmに接続
    let realm = try! Realm()
    
    // 配列taskArrayにUserTableで取得したデータを日付順に格納する（宣言を含む形の記述）
    var taskArray = try! Realm().objects(UserTable.self).sorted(byKeyPath: "date", ascending: true)
    
    // タスクを新規作成する場合
    // +ボタン押下時にSegueでTaskViewへ画面遷移する    
    @IBAction func nextPageButton(_ sender: Any) {
        self.performSegue(withIdentifier: "showTaskView", sender: nil)
    }
    
    // 検索ボタンをクリック時
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // キーボードを閉じる
        view.endEditing(true)
        // キーワードを取得する
        guard let searchText = searchBar.text else {
            return
        }
        // 配列内をRealmで検索する
        taskArray = realm.objects(UserTable.self).filter("userTable.category contains %@", searchText)
    }
        
    // Viewが最初に表示される前に必要な初期化処理を記載
    override func viewDidLoad() {
        super.viewDidLoad()
        // Search Barのdelegate通知先を設定する
        searchText.delegate = self
        // 入力のヒントとなるプレースホルダを設定
        searchText.placeholder = "カテゴリのキーワードを入力"
        // Table ViewのdataSourceを設定
        tableView.dataSource = self
    }
    
    // tableView関数を使用してデータを表示する
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

