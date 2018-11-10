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
 	class func sharedCMAccount() -> GSAccount {
		return instance
	}
	
	func setContent(token:String,phone:String,password:String,nick:String) {
		
		self.phone = phone
		self.nick = nick
		self.password = password
		self.token = token
	}
	

	func changeloginOutStatus(tokenStr:String?){
		
		GSAccount.sharedCMAccount().token = tokenStr
 		guard GSAccount.sharedCMAccount().token != nil else {
			
//			UIApplication.shared.delegate?.window??.rootViewController = CMLoginController()
//			UIApplication.shared.delegate?.window??.makeKeyAndVisible()
			
			return ;
		}
		UIApplication.shared.delegate?.window??.rootViewController = GSTabBarController()
		UIApplication.shared.delegate?.window??.makeKeyAndVisible()
	}
	
}
