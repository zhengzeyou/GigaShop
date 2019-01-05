//
//  CMAccount.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSAccount: NSObject {
	var token:String? = ""
	var phone:String = ""
	var password:String = ""
	var nick:String = ""
	
	static let instance: GSAccount = GSAccount()
 	class func shared() -> GSAccount {
		return instance
	}
	
	func setContent(token:String,phone:String,password:String,nick:String) {
		
		self.phone = phone
		self.nick = nick
		self.password = password
		self.token = token
		Constant.GSUserDefaults.set(self, forKey: "userInfo")
		Constant.GSUserDefaults.synchronize()
	}
	

	func changeloginOutStatus(tokenStr:String?){
		
		GSAccount.shared().token = tokenStr
 		guard token != nil else {
			let login:GSLoginController = GSLoginController()
 			UIApplication.shared.delegate?.window??.rootViewController = UINavigationController(rootViewController: login)
			UIApplication.shared.delegate?.window??.makeKeyAndVisible()
			
			return ;
		}
		UIApplication.shared.delegate?.window??.rootViewController = GSTabBarController()
		UIApplication.shared.delegate?.window??.makeKeyAndVisible()
	}
	
}
