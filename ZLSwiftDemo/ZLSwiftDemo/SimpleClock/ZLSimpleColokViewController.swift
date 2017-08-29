//
//  ZLSimpleColokViewController.swift
//  ZLSwiftDemo
//
//  Created by lizhang on 2017/8/16.
//  Copyright © 2017年 ZL. All rights reserved.
//

import UIKit

class ZLSimpleColokViewController: UIViewController {

    let showLabel = UILabel(frame: CGRect(x: 0, y: 0, width: ZLScreenWidth, height: ZLScreenHeight/2))
    let begin = UIButton(frame: CGRect(x: 0, y: ZLScreenHeight/2, width: ZLScreenWidth/2, height: ZLScreenHeight/2))
    let pause = UIButton(frame: CGRect(x: ZLScreenWidth/2, y: ZLScreenHeight/2, width: ZLScreenWidth/2, height: ZLScreenHeight/2))
    var time : Timer?
    var n = 0
    
    let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupView()
    }
    
    func setupView() {
        showLabel.backgroundColor = .yellow
        begin.backgroundColor = .orange
        pause.backgroundColor = .blue
        begin.setTitle("Begin", for: .normal)
        begin.setTitle("Stop", for: .selected)
        pause.setTitle("Pause", for: .normal)
        pause.setTitle("Continue", for: .selected)
        [begin,pause,backButton].forEach{
            ($0.addTarget(self, action:#selector(buttonTapped(sender:)), for: .touchUpInside))
        }
        /*
         bumbers.sort{(first,second) in
         return first > second
         }
         等价
         bumbers.sort{$0 > $1}
         */
        showLabel.text = "0"
        showLabel.textColor = .white
        showLabel.font = UIFont.systemFont(ofSize: ZLScreenHeight/4, weight: ZLScreenWidth/4)
        showLabel.textAlignment = .center
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = .red
        view.addSubview(showLabel)
        view.addSubview(begin)
        view.addSubview(pause)
        view.addSubview(backButton)
    }
    
    func buttonTapped(sender: UIButton) {
        switch sender {
        case begin:
            begin.isSelected = !begin.isSelected
            begin.isSelected ? beginSC() : stopSC()
            break
        case pause:
            pause.isSelected = !pause.isSelected
            pause.isSelected ? pauseSC() : continueSC()
            break
        default:
            self.dismiss(animated: true, completion: { 
                
            })
            break
        }
    }
    
    //MARK: -
    
    func beginSC() {
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeLabel), userInfo: nil, repeats: true)
    }
    
    func stopSC() {
        showLabel.text = "0"
        time?.invalidate()
        time = nil
    }
    
    func pauseSC() {
        if !begin.isSelected {
            return
        }
        time?.invalidate()
        time = nil
    
    }
    
    func continueSC() {
        if !begin.isSelected {
            return
        }
        beginSC()
    }
    
    func changeLabel() {
        n += 1
        showLabel.text = String(n)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
