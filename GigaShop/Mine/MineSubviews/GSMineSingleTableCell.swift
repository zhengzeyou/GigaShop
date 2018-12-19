//
//  GSMineSingleTableCell.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/18.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit

class GSMineSingleTableCell: UITableViewCell {
	var picture:UIImageView!
	var titlelabel:QMUILabel!
	var pricelabel:UILabel!
	var countlabel:UILabel!
	
 	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		createSuv()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func createSuv(){
		selectionStyle = .none
		picture = gigaImageView("https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBhTF7Fo4uif_!!4120736425.jpg",4,1,Constant.vcBgColor)
 		contentView.addSubview(picture)
		picture.snp.makeConstraints {
			$0.left.top.equalTo(15)
			$0.bottom.equalTo(-15)
			$0.width.equalTo(70)
 		}
		
		titlelabel = QMUILabel()
		titlelabel.canPerformCopyAction = true
		titlelabel.text = "三星（SAMSUNG）UA55MUF30Z"
		titlelabel.numberOfLines = 0
		titlelabel.font = .systemFont(ofSize: 15)
		titlelabel.textColor = Constant.blackColor
		contentView.addSubview(titlelabel)
		titlelabel.snp.makeConstraints {
			$0.top.equalTo(picture.snp.top).offset(5)
			$0.left.equalTo(picture.snp.right).offset(10)
			$0.right.equalTo(-10)

		}
		
		pricelabel = gigaLabel("￥2799.00",15,Constant.blackColor,nil)
		contentView.addSubview(pricelabel)
		pricelabel.snp.makeConstraints {
			$0.bottom.equalTo(picture.snp.bottom).offset(-5)
			$0.left.equalTo(picture.snp.right).offset(10)
			$0.right.equalTo(-10)
			
		}
		
		countlabel = gigaLabel("x1",15,Constant.blackColor,.right)
  		contentView.addSubview(countlabel)
		countlabel.snp.makeConstraints {
			$0.top.equalTo(pricelabel.snp.top)
			$0.bottom.equalTo(pricelabel.snp.bottom)
			$0.right.equalTo(-15)
			
		}

		
	}
	
}
