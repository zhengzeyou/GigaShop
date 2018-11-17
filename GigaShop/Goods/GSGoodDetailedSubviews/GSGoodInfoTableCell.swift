//
//  GSGoodMiddleCollectView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/16.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodInfoTableCell: UITableViewCell {
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
		bgView.snp.makeConstraints { (make) in
			make.left.right.bottom.equalToSuperview()
			make.top.equalTo(10)
		}
	}
}
