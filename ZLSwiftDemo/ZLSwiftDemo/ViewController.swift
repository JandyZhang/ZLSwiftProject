//
//  ViewController.swift
//  ZLSwiftDemo
//
//  Created by lizhang on 2017/8/16.
//  Copyright © 2017年 ZL. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView = UITableView()
    let daysArr = ["SimpleColck","CustomFont","PlayLocalVideo"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView.init(frame: CGRect(x:0,y:20,width:self.view.frame.width,height:self.view.frame.height), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let simpleColckVC = ZLSimpleColokViewController()
            self.present(simpleColckVC, animated: true, completion: { 
                
            })
            
        }else if indexPath.row == 1 {
            let customFontVC = ZLCustomFontViewController()
            self.present(customFontVC, animated: true, completion: { 
                
            })
            
        }else if indexPath.row == 2 {
            let playLocalVideoVC = ZLPlayLocalViewViewController()
            self.present(playLocalVideoVC, animated: true, completion: { 
                
            })
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    // 设置分区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    // 设置分区下面的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = daysArr[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

