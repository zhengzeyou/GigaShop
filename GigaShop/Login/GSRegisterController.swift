//
//  GSRegisterViewController.swift
//  GigaShop
//
//  Created by ozawa on 2019/1/4.
//  Copyright © 2019 GIGA Korea. All rights reserved.
//

import UIKit

class GSRegisterController: BaseController {
	var scrollView:TPKeyboardAvoidingScrollView!
	var inputPhone:GSInputView!
	var inputcode:GSInputView!
	var inputPassword:GSInputView!
	var getVerifyCode: UIButton!
 	var timer:Timer!
	var countInt:Int!
	override func loadView() {
		super.loadView()
		
		navigationController?.navigationBar.tintColor = Constant.blackColor
		navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		countInt = 60
 		navigationController?.navigationBar.backgroundColor = UIColor.white
		edgesForExtendedLayout = .bottom
		
	}

    override func viewDidLoad() {
        super.viewDidLoad()
 		addSuv()
	}
	
	private func addSuv(){
		scrollView = TPKeyboardAvoidingScrollView()
		scrollView.backgroundColor = Constant.vcBgColor
		view.addSubview(scrollView)
		scrollView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
		let logo:UIImageView = gigaImageView("img_logo",nil)
		view.addSubview(logo)
		logo.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.top.equalTo(25)
			$0.width.height.equalTo(Constant.screenWidth/3)
		}
		
		inputPhone = GSInputView()
		inputPhone.placeHolder = "输入手机号码".localized()
		scrollView.addSubview(inputPhone)
		inputPhone.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.right.equalTo(-30)
			$0.top.equalTo(logo.snp.bottom).offset(30)
			$0.height.equalTo(50)
		}
		
		inputcode = GSInputView()
		inputcode.secureEntry = true
		inputcode.placeHolder = "输入短信验证码".localized()
		scrollView.addSubview(inputcode)
		inputcode.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.right.equalTo(-30)
			$0.top.equalTo(inputPhone.snp.bottom).offset(20)
			$0.height.equalTo(50)
		}
		
		getVerifyCode = UIButton()
		getVerifyCode.titleLabel?.font=UIFont.systemFont(ofSize: 14)
		getVerifyCode.setTitle("接受验证码".localized(), for: .normal)
		getVerifyCode.setTitleColor(UIColor.colorFromHex(hex: 0x0072ff), for: .normal)
 		getVerifyCode.addTarget(self, action: #selector(getVerifyCodeBtn), for: .touchUpInside)
		scrollView.addSubview(getVerifyCode)
		getVerifyCode.snp.makeConstraints {
			$0.centerY.equalTo(inputcode.snp.centerY)
			$0.left.equalTo(Constant.screenWidth - 110)
			$0.width.equalTo(80)
			$0.height.equalTo(30)

		}


		
		inputPassword = GSInputView()
		inputPassword.secureEntry = true
		inputPassword.placeHolder = "设置账号密码".localized()
		scrollView.addSubview(inputPassword)
		inputPassword.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.right.equalTo(-30)
			$0.top.equalTo(inputcode.snp.bottom).offset(20)
			$0.height.equalTo(50)
		}
		
		
		let registerlogin:UIButton = UIButton(frame: .zero)
		registerlogin.addTarget(self, action: #selector(action), for: .touchUpInside)
		registerlogin.tag = buttonType.registertype.rawValue
		registerlogin.backgroundColor = Constant.redColor
		registerlogin.setTitle("注册并登录".localized(), for: .normal)
		registerlogin.setTitleColor(Constant.vcBgColor, for: .normal)
		scrollView.addSubview(registerlogin)
		registerlogin.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.width.equalTo(Constant.screenWidth - 60)
			$0.top.equalTo(inputPassword.snp.bottom).offset(60)
			$0.height.equalTo(60)
		}
		
 
	}
	
	@objc private func action(sender:UIButton){
		switch sender.tag {
		case buttonType.registertype.rawValue:
 			break
			
		default:
			break
		}
	}

	@objc private func getVerifyCodeBtn(){
		//		if (inputPhone.field.text?.count)! > 0 {
		getVerifyCode.setTitle("还剩".localized() + "60"+"s", for: .normal)
		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reverseCountTime), userInfo: nil, repeats: true)
		timer.fire()
		
		//		}
	}
	@objc private func reverseCountTime(){
		
		if countInt > 0{
			getVerifyCode.isUserInteractionEnabled = false
			getVerifyCode.setTitle("还剩".localized() + String(self.countInt)+"s", for: .normal)
			countInt = countInt-1
		}else {
			getVerifyCode.setTitle("发送短信".localized() , for: .normal)
			countInt = 60
			timer.invalidate()
			getVerifyCode.isUserInteractionEnabled = true
			
		}
		
	}
}
