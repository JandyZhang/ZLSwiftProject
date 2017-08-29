//
//  ZLCustomFontViewController.swift
//  ZLSwiftDemo
//
//  Created by lizhang on 2017/8/16.
//  Copyright © 2017年 ZL. All rights reserved.
//

import UIKit

class ZLCustomFontViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView(frame: CGRect(x:0,y:0,width:ZLScreenWidth,height:ZLScreenHeight), style: .plain)
    let button = UIButton(frame: CGRect(x: 0, y: ZLScreenHeight/3*2, width: ZLScreenWidth, height: ZLScreenWidth/3))
    let datas = ["点击一下改变字体，","字体就会改变，","你相信不，","不相信么，","点一下试试吧😊！"]
    let fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Heiti SC"]
    var fontNumber = 0
    let reuseIdentifier = "FontCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        
        button.setTitle("改变字体", for: UIControlState.normal);
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(changFont), for: UIControlEvents.touchUpInside)
        view.addSubview(tableView)
        view.addSubview(button)
    }
    
    func changFont() {
        fontNumber = (fontNumber+1)%fontNames.count
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITabelViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ZLScreenHeight * 2 / 3 / CGFloat(datas.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        cell.backgroundColor = .black
        let text = datas[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: fontNames[fontNumber], size: 24)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        let str = "当前字体是" + (cell?.textLabel?.font.fontName)!
        
        print(str)
    }
}
