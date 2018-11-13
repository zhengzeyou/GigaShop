//
//  GSCartController.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCartController: BaseController {
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		emptyCart()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor =  Constant.vcBgColor

    }
	
}


extension GSCartController{
	
	fileprivate func emptyCart(){
		let emptytitle:UILabel = UILabel()
		emptytitle.text = "购物车什么都没有~"
		emptytitle.textColor = Constant.greyColor
		view.addSubview(emptytitle)
		emptytitle.snp.makeConstraints { (make) in
			make.center.equalToSuperview()
		}
		
		let emptyIcon:UIImageView = UIImageView(image: UIImage(named: "img_empty_cart"))
		view.addSubview(emptyIcon)
		emptyIcon.snp.makeConstraints { (make) in
			make.bottom.equalTo(emptytitle.snp.top).offset(-10)
			make.width.height.equalTo(emptytitle.snp.width)
			make.centerX.equalToSuperview()
		}
		
		let emptybtn:UIButton = UIButton()
		emptybtn.layer.cornerRadius = 20
		emptybtn.layer.masksToBounds = true
		emptybtn.setTitle("去逛逛", for: .normal)
		emptybtn.setTitleColor(UIColor.white, for: .normal)
		emptybtn.backgroundColor = Constant.redColor
		emptybtn.addTarget(self, action: #selector(goShop), for: .touchUpInside)
		view.addSubview(emptybtn)
		emptybtn.snp.makeConstraints { (make) in
			make.top.equalTo(emptytitle.snp.bottom).offset(20)
			make.left.equalTo(emptytitle.snp.left).offset(10)
			make.right.equalTo(emptytitle.snp.right).offset(-10)
			make.height.equalTo(40)
			
		}
	}
	
	
	@objc func goShop(sender:UIButton){
		print("go shop")
	}
	

}
