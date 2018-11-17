//
//  GSGoodSelectSizeCountView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodSelectSizeCountView: UIView {
	let number:UILabel = UILabel()
	var minus:UIButton!
	var plus:UIButton!
 	var num:Int?
	var changeNumber:((Int) -> Void)?
	var heightValue:Int? = 30
	//显示的模式
	enum showMode {
		case showGrid
		case showGray
	}

	var mode : showMode? {
		didSet{
			switch mode ?? .showGrid {
			case .showGrid:
				self.layer.cornerRadius = 3
				self.layer.masksToBounds = true
				self.layer.borderColor = Constant.vcBgColor.cgColor
				self.layer.borderWidth = 1
				break
			case .showGray:
				minus.setImage(UIImage(named: "icon_add_001"), for: .normal)
				plus.setImage(UIImage(named: "icon_minus_001"), for: .normal)
				number.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
 				number.snp.updateConstraints { (make) in
 					make.left.equalTo(plus.snp.right).offset(5)
					make.right.equalTo(minus.snp.left).offset(-5)
 				}
				minus.snp.updateConstraints { (make) in
 					make.width.height.equalTo(self.heightValue!)
					
				}
				plus.snp.updateConstraints { (make) in
					make.width.height.equalTo(self.heightValue!)
 				}

				break
				
			}
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubView()
	}
	

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	fileprivate func addSubView(){
		
		
		minus = UIButton()
		minus.tag = 0
		minus.addTarget(self, action: #selector(numberaction), for: .touchUpInside)
		minus.setImage(UIImage(named: "icon_minus"), for: .normal)
		self.addSubview(minus)
		minus.snp.makeConstraints { (make) in
			make.right.top.equalToSuperview()
			make.width.height.equalTo(self.heightValue!)

		}
		
		plus = UIButton()
		plus.tag = 1
		plus.addTarget(self, action: #selector(numberaction), for: .touchUpInside)
		plus.setImage(UIImage(named: "icon_plus"), for: .normal)
		self.addSubview(plus)
		plus.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview()
			make.width.height.equalTo(self.heightValue!)
		}
		
		number.textAlignment = .center
		number.layer.borderWidth = 1
		number.layer.borderColor = Constant.vcBgColor.cgColor
		self.addSubview(number)
		number.snp.makeConstraints { (make) in
			make.bottom.top.equalToSuperview()
			make.left.equalTo(plus.snp.right)
			make.right.equalTo(minus.snp.left)
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
