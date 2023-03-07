//
//  ViewController.swift
//  MyJanken
//
//  Created by USER on 2022/09/21.
//

import UIKit

class ViewController: UIViewController {

    // UIViewControllerのviewDidLoad()メソッドを上書き
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad is called")
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var answerImageView: UIImageView!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    // じゃんけん（数字）
    var answerNumber = 0
    
    @IBAction func shuffleAction(_ sender: Any) {
        
        // 新しいじゃんけんの結果を一時的に格納する変数を設ける
        var newAnswerNumber = 0
        
        // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
        // repeat は繰り返しを意味する
        repeat {
            
            // 0,1,2の数値をランダムに算出（乱数）
            newAnswerNumber = Int.random(in: 0..<3)
            
            // 前回と同じ結果のときは再度ランダムに結果を出す
            // 異なる結果のときは、repeatを抜ける
        } while answerNumber == newAnswerNumber
            // 新しいじゃんけんの結果を格納
            answerNumber = newAnswerNumber
        
        if answerNumber == 0 {
            answerLabel.text = "グー "
            answerImageView.image = UIImage(named:"gu")
            
        } else if answerNumber == 1 {
            // チョキ
            answerLabel.text = "チョキ"
            answerImageView.image = UIImage(named: "choki")

        } else if answerNumber == 2 {
        // パー
        answerLabel.text = "パー"
        answerImageView.image = UIImage(named: "pa")
    }
    
}

}
