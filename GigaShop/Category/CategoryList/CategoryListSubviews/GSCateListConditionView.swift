//
//  GSCateListConditionView.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/20.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCateListConditionView: UIView {
	let titles:[String] = ["综合","人气","价格","价格区间"]
	let icons:[String] = ["icon_pulldown_n","icon_pulldown_n","icon_price_arrow","icon_pulldown_n"]
	var flag:Bool? = false
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.white
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		for i in 0 ..< titles.count {
 
			let btn:UIButton = UIButton()
			btn.tag = i + 1
			btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
			btn.setTitleColor(Constant.blackColor, for: .normal)
			btn.setTitleColor(Constant.redColor, for: .selected)
 			btn.titleLabel?.font = .systemFont(ofSize: 14)
			btn.set(image:UIImage(named: icons[i]), title: titles[i], titlePosition: .left, additionalSpacing: 12, state: .normal)
			self.addSubview(btn)
			btn.snp.makeConstraints { (make) in
				make.bottom.top.equalToSuperview()
				make.width.equalTo(Constant.screenWidth/4)
				make.left.equalTo(CGFloat(i)*Constant.screenWidth/4)
			}

			switch i {
 			case 0:
				btn.isSelected = true
				btn.set(image:UIImage(named: "icon_pulldown_s"), title: titles[i], titlePosition: .left, additionalSpacing: 12, state: .selected)
 			case 1:
				btn.set(image:UIImage(named: "icon_pulldown_s"), title: titles[i], titlePosition: .left, additionalSpacing: 12, state: .selected)
			case 3:
				btn.set(image:UIImage(named: "icon_pulldown_s"), title: titles[i], titlePosition: .left, additionalSpacing: 12, state: .selected)
			default:
				btn.set(image:UIImage(named: "icon_price_low"), title: titles[i], titlePosition: .left, additionalSpacing: 12, state: .selected)

				break
			}
  		}
	}
	
	@objc private func clickBtn(sender:UIButton){
		
		if sender.tag == 3 {
			let btn:UIButton = self.viewWithTag(3) as! UIButton

			if flag == true {
				btn.set(image:UIImage(named: "icon_price_high"), title: titles[2], titlePosition: .left, additionalSpacing: 12, state: .selected)
//				for i in 0 ..< titles.count {
//				let btn:UIButton = self.viewWithTag(3) as! UIButton
//				if i == 2 {
				flag = false
				sender.isSelected = true
				
//				}
//				}
 			}else{
				btn.set(image:UIImage(named: "icon_price_low"), title: titles[2], titlePosition: .left, additionalSpacing: 12, state: .selected)
 				for i in 0 ..< titles.count {
					let btn:UIButton = self.viewWithTag(i+1) as! UIButton
					btn.isSelected = false
				}
				flag = true
				sender.isSelected = !sender.isSelected
  			}

		}else{
			for i in 0 ..< titles.count {
				let btn:UIButton = self.viewWithTag(i+1) as! UIButton
				btn.isSelected = false
			}
			sender.isSelected = !sender.isSelected

		}

		
	}
}