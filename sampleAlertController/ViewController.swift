//
//  ViewController.swift
//  sampleAlertController
//
//  Created by yuka on 2018/05/24.
//  Copyright © 2018年 yuka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func tapButton(_ sender: UIButton) {
        //アラートを作る
        let alertController = UIAlertController(title: "問題です", message: "お風呂で使うものは？", preferredStyle: .alert)


        //OKボタンを追加
        // handler はボタンが押された時に発動
        // {} クロージャーという無名関数
        alertController.addAction(UIAlertAction(
            title: "桶",
            style: .default,
            handler: {action in
                self.jisakuKansu()
                self.myButton.setTitle("OK押された", for: .normal)
                self.myButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        }))
        
        alertController.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "桶des", style: .destructive, handler: {action in print("destructive!")}))
        
        // 背景色の付け方　後ろのviewにつける
//        alertController.view.backgroundColor = UIColor.cyan
//        alertController.view.layer.cornerRadius = 25  // 角丸にする 25が半透明のviewと同じくらい
        
        // alertの表面に色をつける
        let subview = (alertController.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.backgroundColor = UIColor.darkGray
        
        
        // 参考 : テキストフィールドをAlertに追加もできる
        alertController.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type something here"
            textField.clearButtonMode = .whileEditing
        }
        
        //アラートを表示する
        //completion は動作完了時に発動
        present(alertController, animated: true, completion: {()->Void in print("表示されたよ")})

    }
    
    func jisakuKansu()  {
        print("自作関数発動！")
        self.myButton.titleLabel?.text = "OK押された"
        self.myButton.titleLabel?.textColor = UIColor.black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

