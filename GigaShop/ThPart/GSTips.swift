//
//  GSTips.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/18.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit
enum showMode:Int {
	
	case loading
	case loadend
	case error
	case collect
	case cancelcollect
		
	static let count: Int = 5

	init(offset:Int){
		self.init(rawValue:offset)!
 	}
	
	var text:String?{
		
		switch self {
 		case .loading:
			return "加载中"
		case .loadend:
			return "加载完成"
 		case .error:
			return "加载出错"
		case .collect:
			return "收藏成功"
		case .cancelcollect:
			return "取消收藏"
   		}
		
	}
	
	
  }

class GSTips: QMUITips {
	
	init(view: UIView, mode:showMode) {
		super.init(view: view)
		switch mode {
		case .loading:
			showLoading(mode.text)
		case .loadend:
			showSucceed(mode.text)
		case .error:
			showError(mode.text, hideAfterDelay: 1.5)
		case .collect ,.cancelcollect:
			show(withText: mode.text, hideAfterDelay: 1.5)
 		}
		view.addSubview(self)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

}
