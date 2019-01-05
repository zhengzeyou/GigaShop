//
//  GSGoodLardCommentTabCell.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/26.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodLardCommentTabCell: UITableViewCell {


	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		print("创建了自视图")
		let bgView:UIView = UIView()
		bgView.backgroundColor = Constant.vcBgColor
		bgView.layer.contents = 5
		bgView.layer.masksToBounds = true
		self.contentView.addSubview(bgView)
		bgView.snp.makeConstraints { 
 			$0.left.top.equalTo(15)
			$0.right.bottom.equalTo(-15)
		}
		
		let str:String = "商家回复:".localized() + " 你好，关于护肤品有裂痕的问题 。是因为在生产过程中造成的，真的很抱歉，护肤品建议不要放在阳关直射的d地方，常温是25摄氏度以下。对于你提出的问题我我们以后会督促生产。对你的影响深表抱歉"
		let h:CGFloat = UILabel.getTextHeigh(content: str, font: 15, width: Constant.screenWidth - 50)
  		let label:UILabel = UILabel(frame: CGRect(x: 10, y: 10, width: Constant.screenWidth - 50, height: h))
		label.text = str
		label.numberOfLines = 0
		label.textColor = Constant.blackColor
		label.font = .systemFont(ofSize: 15)
		UILabel.LableTextColor(lab: label, sizeFont: 15, textColor:Constant.redColor, startInt: 0, len: 5)
 		bgView.addSubview(label)
 	}

}
