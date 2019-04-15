//
//  ViewController.swift
//  Discount_Easy
//
//  Created by 服部翼 on 2019/04/11.
//  Copyright © 2019 服部翼. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Discount_price: UILabel!
    @IBOutlet weak var Original_price: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var Consumption_tax: UILabel!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var calculation: UIButton!
    
    
    @IBOutlet weak var original_text: UITextField!
    @IBOutlet weak var discount_text: UITextField!
    
    @IBOutlet weak var totalPrice_label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //original_text.borderStyle = .none ←textFiledの枠線を消す。しかしこれがあるとtextFiledに文字が打てなかった
        original_text.layer.cornerRadius = 10.0//角丸
        original_text.layer.borderColor = UIColor.lightGray.cgColor
        original_text.layer.borderWidth = 2.0
        original_text.layer.masksToBounds = true //masktoboundsを書かないとtectFiledの元の枠線がそのままになった
        
        
        discount_text.layer.cornerRadius = 10.0
        discount_text.layer.borderColor = UIColor.lightGray.cgColor
        discount_text.layer.borderWidth = 2.0
        discount_text.layer.masksToBounds = true
        
        Discount_price.layer.borderWidth = 2.0 //ラベルの枠線
        Discount_price.layer.cornerRadius = 15.0 //ラベルの角丸
        Discount_price.clipsToBounds = true //ラベルの場合はこれが必要らしい
        //↑書かなくても機能している（いらない？）→これを書かないとラベルの枠から背景色がはみ出した
        Discount_price.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        Original_price.layer.borderWidth = 4.0
        Original_price.layer.cornerRadius = 15.0
        Original_price.clipsToBounds = true
        Original_price.backgroundColor = UIColor(red: 1.0, green: 127/255.0, blue: 160/255.0, alpha: 1.0) //背景色
        // alphaは恐らく透過率！？（薄くする？）←発見！！
        Original_price.layer.borderColor = UIColor.white.cgColor //枠の色を白くした
        Original_price.textColor = UIColor.white //文字色
        
        
        discount.layer.borderWidth = 4.0
        discount.layer.cornerRadius = 15.0
        discount.clipsToBounds = true
        discount.backgroundColor = UIColor(red: 255/255, green:80/255, blue: 70/255, alpha: 0.8)
        discount.layer.borderColor = UIColor.white.cgColor
        discount.textColor = UIColor.white
        
        Consumption_tax.layer.borderWidth = 4.0
        Consumption_tax.layer.cornerRadius = 15.0
        Consumption_tax.clipsToBounds = true
        Consumption_tax.backgroundColor = UIColor(red: 230/255, green: 120/255, blue: 250/255, alpha: 0.5)
        Consumption_tax.layer.borderColor = UIColor.white.cgColor
        Consumption_tax.textColor = UIColor.white
        
        
        delete.layer.masksToBounds = true
        delete.layer.cornerRadius = 35.0
        delete.backgroundColor = UIColor(red: 30/255.0, green: 40/255.0, blue: 230/255.0, alpha: 0.8)
        delete.setTitleColor(UIColor.white, for: .normal)//ボタンのテキストの文字色を変更する
        
        
        calculation.layer.masksToBounds = true
        calculation.layer.cornerRadius = 35.0
        calculation.backgroundColor = UIColor(red: 30/255.0, green: 40/255.0, blue: 230/255.0, alpha: 0.8)
        calculation.setTitleColor(UIColor.white, for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func delete_button(_ sender: Any) {
        original_text.text = nil
        discount_text.text = nil
        totalPrice_label.text = nil
    }
    
    @IBAction func calculation_button(_ sender: Any) {
        guard let originalPrice: Int = Int(original_text.text!) else {
            return
        } //guardを入れることで数字以外（Int型のみ）の文字が入力された際に処理を実行しない？
        guard let disPrice: Int = Int(discount_text.text!) else {
            return
        }
        
        let discounted: Double = Double(disPrice) / 100 //disPriceに記入された数値を100で割り、割引価格を出す際に必要な数値を出す（小数点になるのでDouble型）
        let discounted_price: Double = Double(originalPrice) * discounted //元の値段と↑で出した数値を計算し割引する値段を出す（小数点になるのでDouble型）
        
        let total: Double? = Double(originalPrice) - discounted_price //元の値段から割引する値段を引き（オプショナルにしなくていい？またInt型でへいきかも？　↓で小数点かけるからDouble型でいいか ）
        let taxPrice: Double? = Double(total!) * 1.08 //↑で出した値引きした価格に消費税（1.08）をかける
        
        let price_string: String = String(Int(taxPrice!)) //taxPriceをString型にする（またInt型にして小数点を切り捨て表示する）
        totalPrice_label.text = price_string //テキストに表示する文
        
    }
    
    @IBAction func tapScreen(_ sender: Any) {
        view.endEditing(true) //画面をタップするとキーボードが隠れる
    }
    
}

