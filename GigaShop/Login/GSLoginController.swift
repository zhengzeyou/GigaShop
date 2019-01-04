//
//  GSLoginController.swift
//  GigaShop
//
//  Created by ozawa on 2019/1/4.
//  Copyright © 2019 GIGA Korea. All rights reserved.
//

import UIKit
enum buttonType:Int {
	case logintype = 1
	case registertype
	case forgetpassword
	
}

class GSLoginController: BaseController {
	var scrollView:TPKeyboardAvoidingScrollView!
	var inputPhone:GSInputView!
	var inputPassword:GSInputView!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
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
		inputPhone.placeHolder = "输入手机号码"
		scrollView.addSubview(inputPhone)
		inputPhone.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.right.equalTo(-30)
 			$0.top.equalTo(logo.snp.bottom).offset(30)
			$0.height.equalTo(50)
		}
		
		inputPassword = GSInputView()
		inputPassword.secureEntry = true
		inputPassword.placeHolder = "输入账号密码"
		scrollView.addSubview(inputPassword)
		inputPassword.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.right.equalTo(-30)
			$0.top.equalTo(inputPhone.snp.bottom).offset(20)
			$0.height.equalTo(50)
		}

		
		let login:UIButton = UIButton(frame: .zero)
		login.addTarget(self, action: #selector(action), for: .touchUpInside)
		login.tag = buttonType.logintype.rawValue
 		login.backgroundColor = Constant.redColor
		login.setTitle("登录", for: .normal)
		login.setTitleColor(Constant.vcBgColor, for: .normal)
		scrollView.addSubview(login)
		login.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.width.equalTo(Constant.screenWidth - 60)
   			$0.top.equalTo(inputPassword.snp.bottom).offset(60)
			$0.height.equalTo(60)
		}
		
		let register:UIButton = UIButton(frame: .zero)
		register.addTarget(self, action: #selector(action), for: .touchUpInside)
 		register.tag = buttonType.registertype.rawValue
 		register.backgroundColor = Constant.vcBgColor
		register.setTitle("注册", for: .normal)
		register.layer.borderColor = Constant.redColor.cgColor
		register.layer.borderWidth = 1
		register.setTitleColor(Constant.redColor, for: .normal)
		scrollView.addSubview(register)
		register.snp.makeConstraints {
			$0.left.right.equalTo(login)
			$0.top.equalTo(login.snp.bottom).offset(20)
			$0.height.equalTo(60)
		}
		
		let forget:UIButton = UIButton(frame: .zero)
		forget.addTarget(self, action: #selector(action), for: .touchUpInside)
 		forget.tag = buttonType.forgetpassword.rawValue
		forget.backgroundColor = Constant.vcBgColor
		forget.setTitle("忘记密码？", for: .normal)
 		forget.setTitleColor(Constant.greyColor, for: .normal)
		scrollView.addSubview(forget)
		forget.snp.makeConstraints {
			$0.left.right.equalTo(login)
			$0.top.equalTo(register.snp.bottom)
			$0.height.equalTo(60)
		}


	}

	
	@objc private func action(sender:UIButton){
		switch sender.tag {
		case buttonType.registertype.rawValue:
			let register:GSRegisterController = GSRegisterController()
			register.title = "注册"
			navigationController?.pushViewController(register, animated: true)
			break
		case buttonType.forgetpassword.rawValue:
			let forget:GSForgetPwdController = GSForgetPwdController()
			forget.title = "忘记密码"
			navigationController?.pushViewController(forget, animated: true)
			break

		default:
			break
		}
	}

}
