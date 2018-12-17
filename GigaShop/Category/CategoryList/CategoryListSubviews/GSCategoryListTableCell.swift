//
//  GSCategoryListTableCell.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/20.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCategoryListTableCell: UITableViewCell {
	var imageview:UIImageView!
	var contentLab:UILabel!
	var curentPrice:UILabel!
	var marketPrice:UILabel!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

	private func addSubviews(){
		
		imageview = UIImageView()
		self.contentView.addSubview(imageview)
		imageview.snp.makeConstraints {
			$0.bottom.equalToSuperview()
			$0.top.left.equalTo(20)
			$0.width.equalTo(120)
		}
		imageview.layer.borderWidth = 1
		imageview.layer.borderColor = Constant.vcBgColor.cgColor
		imageview.kf.setImage(with: URL(string: "https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBhTF7Fo4uif_!!4120736425.jpg"))

		contentLab = UILabel()
		contentLab.text = "碧蒙萱 bioemsan 非离子迷迭洁面乳150ml化妆水100ml保湿霜70ml套装"
		contentLab.textColor = Constant.blackColor
		contentLab.numberOfLines = 0
		self.contentView.addSubview(contentLab)
 		contentLab.snp.makeConstraints {
			$0.top.equalTo(imageview.snp.top)
			$0.left.equalTo(imageview.snp.right).offset(10)
			$0.right.equalTo(-15)
		}
		
		curentPrice = UILabel()
		curentPrice.textColor = Constant.redColor
		curentPrice.text = "￥7199.00"
		self.contentView.addSubview(curentPrice)
		curentPrice.snp.makeConstraints {
			$0.left.equalTo(contentLab.snp.left)
			$0.bottom.equalTo(imageview.snp.bottom).offset(-10)
		}
		
		marketPrice = UILabel()
		marketPrice.textColor = Constant.greyColor
		marketPrice.text = "￥7300.00"
		self.contentView.addSubview(marketPrice)
		marketPrice.snp.makeConstraints {
			$0.left.equalTo(curentPrice.snp.right).offset(10)
			$0.bottom.equalTo(imageview.snp.bottom).offset(-10)
		}
 	}
}
