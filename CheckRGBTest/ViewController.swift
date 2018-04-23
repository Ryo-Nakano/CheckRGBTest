//
//  ViewController.swift
//  CheckRGBTest
//
//  Created by Ryohei Nanano on 2018/04/20.
//  Copyright © 2018年 GeekSalon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
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
        
        
    }
    
    //==========関数・メソッド==========
    
    //Sliderの変化と値の変化が同期させて処理！
    
    @IBAction func rSlider(_ sender: UISlider) {
        print(Int(rValue.value))
        //Slider側の設定をいじればOK！IntでSliderのValueを取れるようにはなった！
        //あとはこれを背景色に反映させるだけ！
        rInt = Int(rValue.value)
        self.view.backgroundColor = changeColor(r: rInt, g: gInt, b: bInt)
    }
    
    @IBAction func gSlider(_ sender: UISlider) {
        print(gValue.value)
        gInt = Int(gValue.value)
        self.view.backgroundColor = changeColor(r: rInt, g: gInt, b: bInt)
    }
    
    @IBAction func bSlider(_ sender: UISlider) {
        print(gValue.value)
        bInt = Int(bValue.value)
        self.view.backgroundColor = changeColor(r: rInt, g: gInt, b: bInt)
    }
    
    //引数とって、UIColorを返す関数
    func changeColor(r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
    }
    
}

