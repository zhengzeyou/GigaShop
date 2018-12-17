//
//  GSMineTopView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/13.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSMineTopView: UIView {
	
	private var avator:UIImageView!
	private var name:UILabel!
	private var phonelab:UILabel!
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = Constant.redColor
		addSuv()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	fileprivate func addSuv(){
		
		let bgimg:UIImageView = UIImageView(image:gigaImg("img_bg_personal"))
		self.addSubview(bgimg)
		bgimg.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
		avator = UIImageView(image:  gigaImg("img_default_image"))
		avator.layer.cornerRadius = Constant.screenWidth/10
		avator.layer.masksToBounds = true
		bgimg.addSubview(avator)
		avator.snp.makeConstraints { (make) in
			make.left.equalTo(15)
			make.bottom.equalTo(-25)
			make.width.height.equalTo(Constant.screenWidth/5)
		}
		
		name = UILabel()
		name.text = "DaWangGe"
		name.font = .systemFont(ofSize: 22)
		name.textColor = UIColor.white
		bgimg.addSubview(name)
		name.snp.makeConstraints { (make) in
			make.bottom.equalTo(avator.snp.centerY).offset(-3)
			make.left.equalTo(avator.snp.right).offset(10)
		}
		
		let phone:UIImageView = UIImageView(image: gigaImg("icon_telephone"))
		bgimg.addSubview(phone)
		phone.snp.makeConstraints { (make) in
			make.top.equalTo(avator.snp.centerY).offset(3)
			make.left.equalTo(avator.snp.right).offset(10)
			make.width.height.equalTo(20)
		}
		
		phonelab = UILabel()
		phonelab.text = "13248876787"
		phonelab.textColor = UIColor.white
		bgimg.addSubview(phonelab)
		phonelab.snp.makeConstraints { (make) in
 			make.left.equalTo(phone.snp.right).offset(5)
			make.bottom.equalTo(phone.snp.bottom)
			make.top.equalTo(phone.snp.top)
		}

		
		let setting:UIButton = UIButton()
		setting.layer.cornerRadius = Constant.screenWidth/20
		setting.layer.masksToBounds = true
		setting.alpha = 0.3
		setting.setTitle("设置", for: .normal)
		setting.setTitleColor(UIColor.white, for: .normal)
		setting.backgroundColor = Constant.blackColor
		setting.addTarget(self, action: #selector(settingAction), for: .touchUpInside)
		bgimg.addSubview(setting)
		setting.snp.makeConstraints { (make) in
			make.centerY.equalTo(avator.snp.centerY)
			make.right.equalTo(-15)
			make.width.equalTo(Constant.screenWidth/5)
			make.height.equalTo(Constant.screenWidth/10)
		}
	}
	
	@objc func settingAction(sender:UIButton){
	
	}
	
	
}
