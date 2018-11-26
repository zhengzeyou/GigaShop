//
//  GSCateListPopSetPriceView.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/21.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCateListPopSetPriceView: UIView {
	var tapCoverMap:(() -> Void)?
	let cover:UIView = UIView()
	var lowPrice:UITextField!
	var highPrice:UITextField!

//	var collectView:UICollectionView?
//	let icons:NSArray = ["icon_upload_img","icon_upload_video","icon_add_folder"]
//	let titles:NSArray = ["上传图片".localized(),"上传视频".localized(),"新建文件夹".localized()]
	var uploadMap:((Int) -> Void)?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		
		self.backgroundColor = UIColor.white
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.colorFromHex(hex: 0xeeeeee).cgColor
		cover.backgroundColor = Constant.blackColor
		cover.alpha = 0.2
		let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickCover))
		cover.addGestureRecognizer(tap)
 		(UIApplication.shared.delegate?.window)!?.addSubview(cover)
		cover.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(self.frame.origin.y)
			make.left.bottom.right.equalToSuperview()
		}
		
		lowPrice = UITextField()
		lowPrice.layer.cornerRadius = 6
		lowPrice.layer.masksToBounds = true
 		lowPrice.textAlignment = .center
		lowPrice.placeholder = "最低价"
		lowPrice.backgroundColor = UIColor.colorFromHex(hex: 0xe2e2e2)
		self.addSubview(lowPrice)
		lowPrice.snp.makeConstraints { (make) in
			make.top.equalTo(50)
			make.left.equalTo(15)
			make.right.equalTo(self.snp.centerX).offset(-40)
			make.height.equalTo(40)
		}
		
		let lab:UILabel = UILabel()
		lab.text = "至"
		self.addSubview(lab)
		lab.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.centerY.equalTo(lowPrice.snp.centerY)
		}
		
		
		highPrice = UITextField()
		highPrice.layer.cornerRadius = 6
		highPrice.layer.masksToBounds = true
 		highPrice.textAlignment = .center
		highPrice.placeholder = "最高价"
		highPrice.backgroundColor = UIColor.colorFromHex(hex: 0xe2e2e2)
		self.addSubview(highPrice)
		highPrice.snp.makeConstraints { (make) in
			make.top.equalTo(50)
			make.right.equalTo(-30)
			make.left.equalTo(self.snp.centerX).offset(40)
			make.height.equalTo(40)
		}

		let sumbit:UIButton = UIButton()
		sumbit.addTarget(self, action: #selector(ok), for: .touchUpInside)
		sumbit.backgroundColor = Constant.redColor
		sumbit.layer.cornerRadius = 6
		sumbit.layer.masksToBounds = true
		sumbit.setTitle("确定", for: .normal)
		sumbit.setTitleColor(UIColor.white, for: .normal)
		self.addSubview(sumbit)
		sumbit.snp.makeConstraints { (make) in
			make.left.equalTo(lowPrice.snp.left)
			make.right.equalTo(highPrice.snp.right)
			make.top.equalTo(lowPrice.snp.bottom).offset(40)
			make.height.equalTo(50)
			
		}
		
 	}
	
	@objc private func ok(sender:UIButton){
 		hiddeSuv()
 
	}
	@objc private func clickCover(){
		guard self.tapCoverMap != nil else {
			return
		}
		self.tapCoverMap?()
		
		hiddeSuv()
	}
	
	public func hiddeSuv(){
		cover.isHidden = true
		cover.removeFromSuperview()
 		self.removeFromSuperview()
	}
}

