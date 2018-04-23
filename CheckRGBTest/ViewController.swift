//
//  ViewController.swift
//  CheckRGBTest
//
//  Created by Ryohei Nanano on 2018/04/20.
//  Copyright © 2018年 GeekSalon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLet: UILabel!
    @IBOutlet weak var textRGB: UILabel!//RGB値を表示
    //これ16進数のカラーコードで表示したいと思ってたんだけど、ちょっとよう分からんから保留！一旦！
    
    @IBOutlet weak var rValueLabel: UILabel!
    @IBOutlet weak var gValueLabel: UILabel!
    @IBOutlet weak var bValueLabel: UILabel!
    
    @IBOutlet weak var rValue: UISlider!
    @IBOutlet weak var gValue: UISlider!
    @IBOutlet weak var bValue: UISlider!
    var rInt: Int = 0
    var gInt: Int = 0
    var bInt: Int = 0
    
    @IBOutlet weak var rgbValueLabel: UILabel!//RGB値を表示する為のLabel
    
    //==========ライフサイクル==========
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rInt = 127
        gInt = 127
        bInt = 127
        self.view.backgroundColor = changeColor(r: rInt, g: gInt, b: bInt)
        
        rValueLabel.text = String(rInt)//Rの値をLabelに反映
        gValueLabel.text = String(gInt)//Gの値をLabelに反映
        bValueLabel.text = String(bInt)//Rの値をLabelに反映
    }
    
    //==========関数・メソッド==========
    
    //Sliderの変化と値の変化を同期させて処理！
    
    @IBAction func rSlider(_ sender: UISlider) {
        print(Int(rValue.value))
        //Slider側の設定をいじればOK！IntでSliderのValueを取れるようにはなった！
        //あとはこれを背景色に反映させるだけ！
        rInt = Int(rValue.value)
        self.view.backgroundColor = changeColor(r: rInt, g: gInt, b: bInt)

        rValueLabel.text = String(rInt)//Rの値をLabelに反映
        
    }
    
    @IBAction func gSlider(_ sender: UISlider) {
        print(gValue.value)
        gInt = Int(gValue.value)
        self.view.backgroundColor = changeColor(r: rInt, g: gInt, b: bInt)
        
        gValueLabel.text = String(gInt)//Gの値をLabelに反映
    }
    
    @IBAction func bSlider(_ sender: UISlider) {
        print(bValue.value)
        bInt = Int(bValue.value)
        self.view.backgroundColor = changeColor(r: rInt, g: gInt, b: bInt)
        
        bValueLabel.text = String(bInt)//Rの値をLabelに反映
        
        changeTextColor()//bIntの値に応じて文字色を変更
    }
    
    //引数とって、UIColorを返す関数
    func changeColor(r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
    }
    
    //背景色に応じてtextの色変える関数
    func changeTextColor(){
        if bInt > 127{
            textLet.textColor = UIColor.black//文字色黒に変更
            textRGB.textColor = UIColor.black//文字色黒に変更
            rValueLabel.textColor = UIColor.black
            gValueLabel.textColor = UIColor.black
            bValueLabel.textColor = UIColor.black
        }
        else{
            textLet.textColor = UIColor.white//文字色白に変更
            textRGB.textColor = UIColor.white//文字色白に変更
            rValueLabel.textColor = UIColor.white
            gValueLabel.textColor = UIColor.white
            bValueLabel.textColor = UIColor.white
        }
    }
    
    //UIColorを引数にとって、それをRGB値に変換する関数
    func convertUIColorToRGB(_ color: UIColor) -> (red: Int, green: Int, blue: Int) {
        let components = color.cgColor.components! // UIColorをCGColorに変換し、RGBとAlphaがそれぞれCGFloatで配列として取得できる
        return (red: Int(components[0]), green: Int(components[1]), blue: Int(components[2]))
    }
    
}

