//
//  VideoTableViewCell.swift
//  ZLSwiftDemo
//
//  Created by lizhang on 2017/8/20.
//  Copyright © 2017年 ZL. All rights reserved.
//

import UIKit

struct VideoModel {
    let image: String
    let title: String
    let source: String
}

class VideoTableViewCell: UITableViewCell {

    let videoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: ZLScreenWidth, height: ZLScreenHeight/3))
    
    let videoTitle = UILabel(frame: CGRect(x: 0, y: ZLScreenHeight/3-50, width: ZLScreenWidth, height: 30))
    
    let videoSource = UILabel(frame: CGRect(x: 0, y: ZLScreenHeight/3-20, width: ZLScreenWidth, height: 20))
    
    private let videoPlay = UIImageView(frame: CGRect(x: 0, y: 0, width: ZLScreenWidth, height: ZLScreenHeight/3))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
