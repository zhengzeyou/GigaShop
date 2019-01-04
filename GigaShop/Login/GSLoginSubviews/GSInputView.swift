//
//  GSInputView.swift
//  GigaShop
//
//  Created by ozawa on 2019/1/4.
//  Copyright © 2019 GIGA Korea. All rights reserved.
//

import UIKit

class GSInputView: UIView,UITextFieldDelegate {
	var field:UITextField!
	var textColor:UIColor?{
		didSet{
		
			field.textColor = textColor
		}
	}
 	var enabled:Bool?{
		didSet{
			field.isEnabled = enabled!
		}
	}
	var font:UIFont?{
		didSet{
			field.font = font
		}
	}
	
	var text:String?{
		didSet{
			field.text = text
		}
	}

	var placeHolder:String?{
		didSet{
			field.placeholder = placeHolder
		}
	}
	var secureEntry:Bool?{
		didSet{
			field.isSecureTextEntry = secureEntry!
		}
	}
	
	
	
	override init(frame: CGRect) {
		
		super.init(frame: frame)
		field = UITextField()
		field.delegate = self
		field.tintColor = Constant.greyColor
		field.textColor = Constant.blackColor
		addSubview(field)
		field.snp.makeConstraints {
			$0.left.equalTo(10)
			$0.right.equalTo(-10)
			$0.top.equalTo(5)
			$0.bottom.equalTo(-5)

		}
		
		let line:UILabel = UILabel()
		line.backgroundColor = UIColor.colorFromHex(hex: 0xdddddd)
		addSubview(line)
		line.snp.makeConstraints {
			$0.bottom.equalToSuperview()
			$0.width.equalTo(Constant.screenWidth - 60)
 			$0.height.equalTo(1)
		}
 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}


