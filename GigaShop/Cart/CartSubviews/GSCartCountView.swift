//
//  GSCartCountView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/14.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCartCountView: UIView {
	let number:UILabel = UILabel()
	var num:Int?
 	var changeNumber:((Int) -> Void)?
	override init(frame: CGRect) {
		super.init(frame: frame)
 		addSubView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	fileprivate func addSubView(){
		self.layer.cornerRadius = 3
		self.layer.masksToBounds = true
		self.layer.borderColor = Constant.vcBgColor.cgColor
		self.layer.borderWidth = 1
		
		let minus:UIButton = UIButton()
		minus.tag = 0
		minus.addTarget(self, action: #selector(numberaction), for: .touchUpInside)
		minus.setImage(UIImage(named: "icon_minus"), for: .normal)
		self.addSubview(minus)
		minus.snp.makeConstraints { (make) in
			make.left.top.bottom.equalToSuperview()
			make.width.equalTo(30)
		}
 
		let plus:UIButton = UIButton()
		plus.tag = 1
 		plus.addTarget(self, action: #selector(numberaction), for: .touchUpInside)
 		plus.setImage(UIImage(named: "icon_plus"), for: .normal)
		self.addSubview(plus)
		plus.snp.makeConstraints { (make) in
			make.right.top.bottom.equalToSuperview()
			make.width.equalTo(30)
		}
		
		number.textAlignment = .center
		number.layer.borderWidth = 1
		number.layer.borderColor = Constant.vcBgColor.cgColor
		self.addSubview(number)
		number.snp.makeConstraints { (make) in
			make.centerX.bottom.top.equalToSuperview()
			make.width.equalTo(30)
		}

		
	}
	
	func setNumberText(nums:Int){
		num = nums
		number.text = String(format: "%d", num!)
		

	}
	
	@objc private func numberaction(sender:UIButton){
		switch sender.tag {
		case 0:
			if num! > 1 {
				num = num! - 1
			}
			break
		default:
 			num = num! + 1
			break
		}
		number.text = String(format: "%d", num!)

		guard changeNumber != nil else {
			return;
		}
		changeNumber!(num!)
	
 	}

}
