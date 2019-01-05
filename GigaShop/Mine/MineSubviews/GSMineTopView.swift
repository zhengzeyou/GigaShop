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
		bgimg.snp.makeConstraints { 
			$0.edges.equalToSuperview()
		}
		
 		avator = UIImageView(image:  gigaImg("img_default_image"))
		avator.layer.cornerRadius = Constant.screenWidth/10
		avator.layer.masksToBounds = true
		bgimg.addSubview(avator)
		avator.snp.makeConstraints { 
			$0.left.equalTo(15)
			$0.bottom.equalTo(-25)
			$0.width.height.equalTo(Constant.screenWidth/5)
		}
		
		name = UILabel()
		name.text = "DaWangGe"
		name.font = .systemFont(ofSize: 22)
		name.textColor = UIColor.white
		bgimg.addSubview(name)
		name.snp.makeConstraints { 
			$0.bottom.equalTo(avator.snp.centerY).offset(-3)
			$0.left.equalTo(avator.snp.right).offset(10)
		}
		
		let phone:UIImageView = UIImageView(image: gigaImg("icon_telephone"))
		bgimg.addSubview(phone)
		phone.snp.makeConstraints { 
			$0.top.equalTo(avator.snp.centerY).offset(3)
			$0.left.equalTo(avator.snp.right).offset(10)
			$0.width.height.equalTo(20)
		}
		
		phonelab = UILabel()
		phonelab.text = "13248876787"
		phonelab.textColor = UIColor.white
		bgimg.addSubview(phonelab)
		phonelab.snp.makeConstraints { 
 			$0.left.equalTo(phone.snp.right).offset(5)
			$0.bottom.equalTo(phone.snp.bottom)
			$0.top.equalTo(phone.snp.top)
		}

		
		let setting:UIButton = UIButton()
		setting.layer.cornerRadius = Constant.screenWidth/20
		setting.layer.masksToBounds = true
		setting.alpha = 0.3
		setting.setTitle("设置".localized(), for: .normal)
		setting.setTitleColor(UIColor.white, for: .normal)
		setting.backgroundColor = Constant.blackColor
		setting.addTarget(self, action: #selector(settingAction), for: .touchUpInside)
		bgimg.addSubview(setting)
		setting.snp.makeConstraints { 
			$0.centerY.equalTo(avator.snp.centerY)
			$0.right.equalTo(-15)
			$0.width.equalTo(Constant.screenWidth/5)
			$0.height.equalTo(Constant.screenWidth/10)
		}
	}
	
	@objc func settingAction(sender:UIButton){
	
	}
	
	
}
