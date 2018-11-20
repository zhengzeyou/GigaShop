//
//  GSGoodCommentStar.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/20.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodCommentStar: UIView {
	var star:CGFloat?{
		didSet {
			
		}
	}
	override init(frame: CGRect) {
		super.init(frame: frame)
		SubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func SubViews(){
		self.backgroundColor = Constant.vcBgColor
		
	}
}
