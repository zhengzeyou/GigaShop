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
  	}

	override func viewDidLoad() {
        super.viewDidLoad()

		addSubviews()
		
    }
	
	private func addSubviews(){

		self.view.backgroundColor = UIColor.colorFromHex(hex: 0xf2f4f6)
		
		indexView = GSCateIndexCollectView()
		indexView.delegate = self
		view.addSubview(indexView)
		indexView.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview()
			make.bottom.equalTo(-(tabBarController?.tabBar.height ?? 0))
 			make.width.equalTo(Constant.screenWidth/4)
		}
		
		valueView = GSCateValueColllectView()
		view.addSubview(valueView)
		valueView.snp.makeConstraints { (make) in
			make.right.equalToSuperview().offset(-10)
			make.bottom.equalTo(-(tabBarController?.tabBar.height ?? 0)-10)
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
