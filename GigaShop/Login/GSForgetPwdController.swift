//
//  GSForgetPasswordController.swift
//  GigaShop
//
//  Created by ozawa on 2019/1/4.
//  Copyright © 2019 GIGA Korea. All rights reserved.
//

import UIKit
enum lang:Int {
	case phone = 0
	case code
	case newpwd
	case renewpwd
	init(offset:Int){
		self.init(rawValue:offset)!
		
	}

	var title:String?{
		switch self {
		case .phone:
			return "手机号"
		case .code:
			return "验证码"
		case .newpwd:
			return "新密码"
		case .renewpwd:
			return "新密码"

		}
	}
	
	
	var placher:String?{
		switch self {
		case .phone:
			return "请输入注册时手机号"
		case .code:
			return "请输入短信验证码"
		case .newpwd:
			return "请设置新密码"
		case .renewpwd:
			return "请再次确认新密码"
		}

	}
}

class GSForgetPwdController: UIViewController {
	var tableview:UITableView!
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
		view.backgroundColor = Constant.vcBgColor
		
		tableview = UITableView(frame: .zero, style: .grouped)
		tableview.estimatedRowHeight = 0
		tableview.estimatedSectionFooterHeight = 0
		tableview.estimatedSectionHeaderHeight = 0
		tableview.delegate = self
		tableview.dataSource = self
		tableview.tableFooterView = UIView()
		tableview.backgroundColor = Constant.vcBgColor
		tableview.separatorColor = UIColor.colorFromHex(hex: 0xdddddd)
		tableview.isScrollEnabled = false
	    view.addSubview(tableview)
		tableview.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		
		let ok:UIButton = UIButton(frame: .zero)
//		ok.addTarget(self, action: #selector(action), for: .touchUpInside)
		ok.layer.cornerRadius = 4
		ok.layer.masksToBounds = true
		ok.backgroundColor = Constant.redColor
		ok.setTitle("确定", for: .normal)
		ok.setTitleColor(Constant.vcBgColor, for: .normal)
		tableview.addSubview(ok)
		ok.snp.makeConstraints {
			$0.left.equalTo(30)
			$0.width.equalTo(Constant.screenWidth - 60)
			$0.top.equalTo(400)
			$0.height.equalTo(50)
		}
     }
 
 }

extension GSForgetPwdController:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = UITableViewCell()
		cell.selectionStyle = .none
		let lg:lang = lang(rawValue: indexPath.section * 2 + indexPath.row)!
		cell.textLabel?.text = lg.title

		let field:UITextField = UITextField(frame: .zero)
		field.tintColor = Constant.greyColor
		field.textColor = Constant.blackColor
 		field.placeholder = lg.placher
		cell.contentView.addSubview(field)
		field.snp.makeConstraints {
			$0.bottom.top.equalToSuperview()
			$0.left.equalTo(100)
			$0.right.equalTo(-15)

		}
		
		if (indexPath.section, indexPath.row) == (0,1) {
			getVerifyCode = UIButton()
			getVerifyCode.titleLabel?.font=UIFont.systemFont(ofSize: 14)
			getVerifyCode.setTitle("发送短信", for: .normal)
			getVerifyCode.setTitleColor(UIColor.colorFromHex(hex: 0x0072ff), for: .normal)
			getVerifyCode.addTarget(self, action: #selector(getVerifyCodeBtn), for: .touchUpInside)
			cell.contentView.addSubview(getVerifyCode)
			getVerifyCode.snp.makeConstraints {
				$0.centerY.equalTo(field.snp.centerY)
				$0.left.equalTo(Constant.screenWidth - 80)
				$0.width.equalTo(60)
				$0.height.equalTo(30)
				
			}

		}

		
		
		return cell
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
		
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.01
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60

	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let lab:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: 60))
		lab.text = section == 0 ? "    账号验证" : "    设置新密码"
		lab.textColor = Constant.greyColor
 		return lab
	}
	
	
	@objc private func getVerifyCodeBtn(){
//		if (inputPhone.field.text?.count)! > 0 {
			getVerifyCode.setTitle("还剩" + "60"+"s", for: .normal)
			timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reverseCountTime), userInfo: nil, repeats: true)
			timer.fire()
 
//		}
	}
	@objc private func reverseCountTime(){
		
		if countInt > 0{
			getVerifyCode.isUserInteractionEnabled = false
			getVerifyCode.setTitle("还剩" + String(self.countInt)+"s", for: .normal)
 			countInt = countInt-1
		}else {
			getVerifyCode.setTitle("发送短信" , for: .normal)
			countInt = 60
  			timer.invalidate()
 			getVerifyCode.isUserInteractionEnabled = true

 		}
		
	}

 }
