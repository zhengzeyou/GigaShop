//
//  GSCategoryController.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCategoryController: BaseController {
	var indexView:GSCateIndexCollectView!
	var valueView:GSCateValueColllectView!
	
	override func loadView()
	{
		super.loadView()
		self.navigationController?.navigationBar.backgroundColor = UIColor.white
  		self.edgesForExtendedLayout = .bottom
		self.tabBarController?.tabBar.isTranslucent = false
  	}

	override func viewDidLoad() {
        super.viewDidLoad()

		addSubviews()
		
    }
	
	private func addSubviews(){

		self.view.backgroundColor =  Constant.vcBgColor
		
		indexView = GSCateIndexCollectView()
		indexView.delegate = self
		view.addSubview(indexView)
		indexView.snp.makeConstraints { (make) in
			make.bottom.left.top.equalToSuperview()
  			make.width.equalTo(Constant.screenWidth/4)
		}
		
		valueView = GSCateValueColllectView()
		view.addSubview(valueView)
		valueView.snp.makeConstraints { (make) in
			make.right.bottom.equalToSuperview().offset(-10)
  			make.top.equalTo(10)
			make.left.equalTo(indexView.snp.right).offset(10)
 		}
		
	}



}

extension GSCategoryController :GSCateIndexCollectViewDelegate {
	func GSCateIndexCollectViewDidSelectedItemAtIndex(_ index: NSInteger) {
		print("选中了" + String(index))
	}
	
	
}
