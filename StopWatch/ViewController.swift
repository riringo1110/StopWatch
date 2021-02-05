//
//  ViewController.swift
//  StopWatch
//
//  Created by Ririko Nagaishi on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func up() {
        //countを0.01足す
        count = count + 0.01
        //ラベルに小数点以下２桁まで表示
        label.text = String(format: "%.2f", count)
        
    }
   
    @IBOutlet var label1: UILabel!
    
    func hantei(){
        if count>=9.80,count<=10.20{
            label1.text = "PERFECT!!"
        if count>=9.70,count<=10.30{
            label1.text = "GREAT!"
        if count>=9.50,count<=10.50{
            label1.text = "GOOD!"
        }else{
            label1.text = "BAD"
        }
    }
}
}
    
    
    @IBAction func start() {
     
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(timeInterval:0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
    }

    @IBAction func stop() {
        if timer.isValid{
            //タイマーが動作していたら停止する
            timer.invalidate()
            //hanteiメソッドの呼び出し、結果を表示する
            self.hantei()
            
        }
    }
    
    
    @IBAction func reset() {
        if timer.isValid{
            //タイマーが動作していたら停止する
            timer.invalidate()
            //countを0.0に初期化する
            count = 0.0
            //初期化したcountをlabelに表示
            label.text = String(count)
        }
       
        if !timer.isValid {
            //タイマーが停止していたらcountを0.0に初期化
            count = 0.0
            //初期化したcountをlabelに表示
            label.text = String(count)
        
        }
        
    }

}
    

