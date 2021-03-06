//
//  GSGoodMiddleCollectView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/16.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodInfoTableCell: UITableViewCell {
	var currentPrice:UILabel!
	var marketPrice:UILabel!
	var goodName:UILabel!
	var expressFee:UILabel!
	var haveSaled:UILabel!
	var address:UILabel!
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
 		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func addSubViews(){
		self.contentView.backgroundColor = Constant.vcBgColor
		self.selectionStyle = .none
		let bgView:UIView = UIView()
		bgView.backgroundColor = UIColor.white
 		self.contentView.addSubview(bgView)
		bgView.snp.makeConstraints { 
			$0.left.right.bottom.equalToSuperview()
			$0.top.equalTo(10)
		}
		goodName = UILabel()
		goodName.numberOfLines = 0
		goodName.textColor = Constant.blackColor
		goodName.text = "碧蒙萱 bioemsan非离子迷迭洁面乳150ml化妆水100ml保湿霜70ml套装"
		bgView.addSubview(goodName)
		goodName.snp.makeConstraints { 
			$0.left.equalTo(15)
 			$0.centerY.equalToSuperview()
			$0.right.equalTo(-5)
		}

		currentPrice = UILabel()
		currentPrice.textColor = Constant.redColor
		currentPrice.text = "￥1254.00"
		currentPrice.font = .systemFont(ofSize: 20)
		bgView.addSubview(currentPrice)
		currentPrice.snp.makeConstraints { 
			$0.left.equalTo(15)
			$0.bottom.equalTo(goodName.snp.top).offset(-6)

		}
		
		marketPrice = UILabel()
		marketPrice.textColor = Constant.greyColor
 		marketPrice.font = .systemFont(ofSize: 14)
		bgView.addSubview(marketPrice)
		marketPrice.snp.makeConstraints { 
			$0.left.equalTo(currentPrice.snp.right).offset(15)
			$0.bottom.equalTo(goodName.snp.top).offset(-6)

		}
		let markpriceS = NSMutableAttributedString.init(string: "市场价：".localized() + "￥1899.00")
		markpriceS.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange(location: 4, length: markpriceS.length-4))
		marketPrice.attributedText = markpriceS
		
		expressFee = UILabel()
		expressFee.textColor = Constant.greyColor
		expressFee.text = "快递：".localized() + "￥20.00"
		expressFee.font = .systemFont(ofSize: 14)
		bgView.addSubview(expressFee)
		expressFee.snp.makeConstraints { 
			$0.left.equalTo(goodName.snp.left)
 			$0.top.equalTo(goodName.snp.bottom).offset(10)
		}

		
		haveSaled = UILabel()
		haveSaled.textColor = Constant.greyColor
		haveSaled.text = "已售：".localized() + "67"
		haveSaled.font = .systemFont(ofSize: 14)
		bgView.addSubview(haveSaled)
		haveSaled.snp.makeConstraints { 
			$0.centerX.equalToSuperview()
			$0.top.equalTo(goodName.snp.bottom).offset(10)
		}
		
		address = UILabel()
		address.textColor = Constant.greyColor
		address.text = "韩国首尔"
		address.font = .systemFont(ofSize: 14)
		bgView.addSubview(address)
		address.snp.makeConstraints { 
			$0.right.equalToSuperview().offset(-15)
			$0.top.equalTo(goodName.snp.bottom).offset(10)
		}

		

	}
}
