//
//  UserTable.swift
//  タスクのモデル定義クラス
//  MyTask
//
//  Created by USER on 2023/03/20.
//

import Foundation
import RealmSwift

// インプット項目の定義（モデル定義）
class UserTable: Object {
    // id
    @objc dynamic var id: String = "" // プライマリーキー項目
    // 日付
    @objc dynamic var date: Date = Date()
    // タイトル
    @objc dynamic var title: String = ""
    // 内容
    @objc dynamic var contents: String = ""
    // カテゴリー
    @objc dynamic var category: String = ""
    
    // プライマリーキーの指定
    override class func primaryKey() -> String? {
        return "id" // idをプライマリーキーに指定する
    }
    

    // 入力処理
    func input() {
        let userTable = UserTable()
        let realm = try! Realm()
        try! realm.write {
            realm.add(userTable)
        }
    }
        
    // 更新処理
    func update() {
        let realm = try! Realm()
        let userTable = realm.objects(UserTable.self).first // 最初のオブジェクトを取得する
        // 内容を更新する
        try! realm.write {
            userTable?.contents = "ddd" // オブジェクトが見つからない場合を考えてオプショナル型にする
        }
    }
        
    // 削除処理
    func delete() {
        let realm = try! Realm()
        // 最初のオブジェクトを取得して削除する
        guard let userTable = realm.objects(UserTable.self).first else {
            return // オブジェクトが存在しない場合に処理を中止する
        }
        try! realm.write {
            realm.delete(userTable)
        }
    }
}

