//
//  UserTable.swift
//  MyTask
//
//  Created by USER on 2023/03/20.
//

import Foundation
import RealmSwift

class UserTable: Object {
    // インプット項目の定義
    // 日付
    @objc dynamic var date: Date = Date()
    // タイトル
    @objc dynamic var title: String = ""
    // 内容
    @objc dynamic var contents: String = ""
    // カテゴリー
    @objc dynamic var category: String = ""

    // 前画面で入力された値を取得する方法はあとで調べる
    // 入力処理
    func input() {
        let userTable = UserTable()
        userTable.date = Date(timeIntervalSince1970: 631152000) // 呼び出し方を考える
        userTable.title = "aaa" // 呼び出し方を考える
        userTable.contents = "bbb" // 呼び出し方を考える
        userTable.category = "ccc" // 呼び出し方を考える
        
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

