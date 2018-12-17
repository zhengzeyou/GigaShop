//
//  GSHomeTopView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSHomeTopView: UIView {
	var bannerView:CycleView!
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = Constant.redColor
		addSuv()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


extension GSHomeTopView:CycleViewDelegate {
	func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
		
	}
	
	fileprivate func addSuv(){
		
		let search:UIButton = UIButton(frame: CGRect(x: 15, y: 40, width: Constant.screenWidth - 30, height: 36))
		search.layer.cornerRadius = 18
		search.layer.masksToBounds = true
		search.backgroundColor = UIColor.colorFromHex(hex: 0xc92728)
		self.addSubview(search)
		
		let searchIcon:UIImageView = UIImageView(image:gigaImg("icon_search"))
		search.addSubview(searchIcon)
		searchIcon.snp.makeConstraints {
			$0.left.equalTo(20)
			$0.centerY.equalToSuperview()
			$0.width.height.equalTo(24)
		}

		let placher:UILabel = UILabel()
		placher.text = "搜索商品名称"
		placher.textColor = UIColor.colorFromHex(hex: 0xe35d5c)
		search.addSubview(placher)
		placher.snp.makeConstraints {
			$0.left.equalTo(searchIcon.snp.right).offset(10)
			$0.centerY.equalToSuperview()
		}
		
		//轮播图加载
		bannerView = CycleView(frame: CGRect(x: 15, y:90 , width: Constant.screenWidth - 30, height: 3*Constant.screenWidth/5.0-76.0))
		bannerView.delegate = self
		bannerView.pgmode = .pointCount
		bannerView.layer.cornerRadius = 3
		bannerView.layer.masksToBounds = true
		bannerView.mode = .scaleAspectFill
		bannerView.currentPageColor = Constant.redColor
		bannerView.pageColor = Constant.greyColor
		self.addSubview(bannerView)
		//本地图片测试--加载网络图片,请用第三方库如SDWebImage等
		bannerView.imageURLStringArr = ["img_02.png", "img_03.png", "img_04.png", "img_05.png"]

	}

}
