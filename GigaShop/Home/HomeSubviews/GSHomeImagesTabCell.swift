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
		self.backgroundColor = Constant.vcBgColor
		
		let big:UIImageView = UIImageView(image:gigaImg("img_01"))
		self.contentView.addSubview(big)
		big.snp.makeConstraints {
			$0.left.top.equalToSuperview()
			$0.width.equalTo(Constant.screenWidth/2)
			$0.height.equalTo(2*Constant.screenWidth/5)
		}
		
		for i in 2...5 {
			let right:UIImageView = UIImageView(image:gigaImg("img_0"+String(i)))
			self.contentView.addSubview(right)
			if i == 5 {
				right.snp.makeConstraints {
					$0.top.equalTo(big.snp.bottom)
					$0.right.equalTo(big.snp.right)
					$0.height.equalTo(Constant.screenWidth/5)
					$0.left.equalToSuperview()
				}
			}
			else {
				right.snp.makeConstraints {
					$0.right.equalToSuperview()
					$0.top.equalTo(CGFloat(i-2)*Constant.screenWidth/5)
					$0.left.equalTo(big.snp.right)
					$0.height.equalTo(Constant.screenWidth/5)
				}

			}
			
		}
		
		let banner:UIImageView = UIImageView(image:gigaImg("img_02"))
		self.contentView.addSubview(banner)
		banner.snp.makeConstraints {
			$0.left.right.bottom.equalToSuperview()
			$0.height.equalTo(Constant.screenWidth/4)
		}

		
	}
		

		
		
	
}
