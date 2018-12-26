//
//  GSGoodCommetTableCell.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/19.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodCommetTableCell: UITableViewCell {
	var avator:UIImageView!
	var name:UILabel!
	var content:UILabel!
	var time:UILabel!
	var commentPic:GSGoodPicBrowerView!
 	var starView:GSStarView!
	
 	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.selectionStyle = .none
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func addSubViews(){
		
		avator = UIImageView()
		avator.layer.cornerRadius = 20
		avator.layer.masksToBounds = true
		contentView.addSubview(avator)
		avator.snp.makeConstraints { 
			$0.left.equalTo(15)
			$0.top.equalTo(10)
			$0.height.width.equalTo(40)
		}
		avator.kf.setImage(with: URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg"))
	
		name = UILabel()
		name.text = "蒂玛西亚"
 		contentView.addSubview(name)
		name.snp.makeConstraints { 
			$0.centerY.equalTo(avator.snp.centerY)
			$0.left.equalTo(avator.snp.right).offset(10)
		}
		
		
		starView = GSStarView()
		starView.setStarValue(value: 3.3, h: 15)
  		contentView.addSubview(starView)
		starView.snp.makeConstraints {
 			$0.right.equalTo(-15)
			$0.top.equalTo(avator.snp.centerY)
			$0.width.equalTo(75)
			$0.height.equalTo(15)
		}
		
		let str:String = "今天是双十一,很高心来到了东京最出名的地标建筑,拍了一场有生以来最劲爆刺激的动作片,期待它和观众朋友们见面。💗"
		let h:CGFloat = UILabel.getTextHeigh(content: str, font: 15, width: Constant.screenWidth - 30)

		content = UILabel(frame: CGRect(x: 15, y: 60, width: Constant.screenWidth - 30, height: h))
 		content.numberOfLines = 0
		content.text = str
		content.textColor = Constant.blackColor
		content.font = .systemFont(ofSize: 15)
		self.contentView.addSubview(content)
		
		
		commentPic = GSGoodPicBrowerView()
		contentView.addSubview(commentPic)
		commentPic.snp.makeConstraints { 
			$0.top.equalTo(content.snp.bottom).offset(10)
			$0.left.equalTo(content.snp.left)
			$0.right.equalTo(content.snp.right)
			$0.height.equalTo(Constant.screenWidth/3.0 - 20.0)
		}
		
 
		time = UILabel()
		time.text = "2018-11-11"
		time.textColor = Constant.greyColor
 		time.font = .systemFont(ofSize: 12)
		contentView.addSubview(time)
		time.snp.makeConstraints { 
			$0.left.equalTo(avator.snp.left)
 			$0.top.equalTo(commentPic.snp.bottom).offset(15)
		}

 	}
}
