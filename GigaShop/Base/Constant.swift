//
//  Constant.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import RxSwift

var defaultImage:UIImage {
	
	let image =  UIImage(named: "icon_category_clothing")?.withRenderingMode(.alwaysOriginal)
 	return image!
}

var gigaImg:(String) -> UIImage = { (icon:String) -> UIImage in
	
	let image =  UIImage(named:icon)?.withRenderingMode(.alwaysOriginal)
	return image!
}
struct Constant {
	
	static let dispose = DisposeBag()
	static let screenWidth = UIScreen.main.bounds.size.width
	static let screenHeight = UIScreen.main.bounds.size.height
 	static let blackColor:UIColor = UIColor.colorFromHex(hex: 0x111111)
	static let greyColor:UIColor = UIColor.colorFromHex(hex: 0x999999)
 	static let vcBgColor:UIColor = UIColor.colorFromHex(hex: 0xf2f4f6)
	static let blueColor:UIColor = UIColor.colorFromHex(hex: 0x113981)
	static let greenColor:UIColor = UIColor.colorFromHex(hex: 0x479f2f)
	static let redColor:UIColor = UIColor.colorFromHex(hex: 0xea3a3c)

	static let mallBaseUrl:String = "http://mall.gigawon.co.kr:8800/api/"

}


