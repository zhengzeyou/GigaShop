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
	var minus:UIButton!
	var plus:UIButton!
	var num:Int = 1
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
				self.layer.borderWidth = 1
 				self.layer.borderColor = Constant.vcBgColor.cgColor
				minus.setImage( gigaImg( "icon_minus"), for: .normal)
				plus.setImage( gigaImg("icon_plus"), for: .normal)
				
				break
			case .showGray:
				self.heightValue = 40
				
				minus.setTitle("-", for: .normal)
				plus.setTitle("+", for: .normal)
				minus.setTitleColor(Constant.greyColor, for: .normal)
 				plus.setTitleColor(Constant.greyColor, for: .normal)
				minus.titleLabel?.font = .systemFont(ofSize: 22)
				plus.titleLabel?.font = .systemFont(ofSize: 22)

				number.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
				number.snp.updateConstraints {
					$0.left.equalTo(minus.snp.right).offset(5)
					$0.right.equalTo(plus.snp.left).offset(-5)
				}
				minus.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
				plus.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
 				minus.snp.updateConstraints {
					$0.width.height.equalTo(self.heightValue!)
 				}
				plus.snp.updateConstraints {
					$0.width.height.equalTo(self.heightValue!)
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
		self.addSubview(minus)
		minus.snp.makeConstraints {
			$0.left.top.equalToSuperview()
			$0.width.height.equalTo(self.heightValue!)
		}
		
		plus = UIButton()
		plus.tag = 1
		plus.addTarget(self, action: #selector(numberaction), for: .touchUpInside)
		self.addSubview(plus)
		plus.snp.makeConstraints {
			$0.right.top.equalToSuperview()
			$0.width.height.equalTo(self.heightValue!)

		}
		
		number.textAlignment = .center
		number.layer.borderWidth = 1
		number.layer.borderColor = Constant.vcBgColor.cgColor
		self.addSubview(number)
		number.snp.makeConstraints {
			$0.bottom.top.equalToSuperview()
			$0.left.equalTo(minus.snp.right)
			$0.right.equalTo(plus.snp.left)
		}
		
		
	}
	
	func setNumberText(nums:Int){
		num = nums
		number.text = String(format: "%d", num)
		
		
	}
	
	@objc private func numberaction(sender:UIButton){
		switch sender.tag {
		case 0:
			if num > 1 {
				num = num - 1
			}
			break
		default:
			num = num + 1
			break
		}
		number.text = String(format: "%d", num)
		
		guard changeNumber != nil else {
			return;
		}
		changeNumber!(num)
		
	}
	
}
