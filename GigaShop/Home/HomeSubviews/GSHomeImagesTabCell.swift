//
//  GSHomeImagesTabCell.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/12.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSHomeImagesTabCell: UITableViewCell {
	
 	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
 		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		self.backgroundColor = UIColor.colorFromHex(hex: 0xf2f4f6)
		
		let big:UIImageView = UIImageView(image: UIImage(named: "img_01"))
		self.contentView.addSubview(big)
		big.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview()
			make.width.equalTo(Constant.screenWidth/2)
			make.height.equalTo(2*Constant.screenWidth/5)
		}
		
		for i in 2...5 {
			let right:UIImageView = UIImageView(image: UIImage(named: "img_0"+String(i)))
			self.contentView.addSubview(right)
			if i == 5 {
				right.snp.makeConstraints { (make) in
					make.top.equalTo(big.snp.bottom)
					make.right.equalTo(big.snp.right)
					make.height.equalTo(Constant.screenWidth/5)
					make.left.equalToSuperview()
				}
			}
			else {
				right.snp.makeConstraints { (make) in
					make.right.equalToSuperview()
					make.top.equalTo(CGFloat(i-2)*Constant.screenWidth/5)
					make.left.equalTo(big.snp.right)
					make.height.equalTo(Constant.screenWidth/5)
				}

			}
			
		}
		
		let banner:UIImageView = UIImageView(image: UIImage(named: "img_02"))
		self.contentView.addSubview(banner)
		banner.snp.makeConstraints { (make) in
			make.left.right.bottom.equalToSuperview()
			make.height.equalTo(Constant.screenWidth/4)
		}

		
	}
		

		
		
	
}
