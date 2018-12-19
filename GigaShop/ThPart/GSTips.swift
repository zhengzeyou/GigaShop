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
	
	static let count: Int = 3

	init(offset:Int){
		self.init(rawValue:offset)!
 	}
	
	var text:String?{
		switch self {
		case .loading:
			return "加载中..."
		case .loadend:
			return "加载完成"
 		case .error:
			return "加载出错"
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
			showError(mode.text, hideAfterDelay: 2)
 		}
		view.addSubview(self)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

}
