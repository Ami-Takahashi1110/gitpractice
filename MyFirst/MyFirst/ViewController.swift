//
//  ViewController.swift
//  MyFirst
//
//  Created by USER on 2022/09/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // (1) ラベルに文字を入れる
        outputLabel.text = "Hello Swift!"
    }

    @IBOutlet weak var outputLabel: UILabel!
    
}

