//
//  GSMineServeTabCell.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/13.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Kingfisher

class  GSMineServeTabCell: UITableViewCell {
	var collectView:UICollectionView!
	var data:NSArray = []
	let titles:[String] = ["我的收藏","我的评价","收货地址","联系客服"]
	let icons:[String] = ["collection","comments","address","contact_us"]
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews(){
		
		let	title:UILabel = gigaLabel("我的服务",20,nil,nil)
  		self.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(15)
			make.top.equalToSuperview().offset(10)
		}
		
		
		
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width:  Constant.screenWidth / 3.0 - 5.0 , height: Constant.screenWidth / 3.0  - 30.0)
		flowlayout.minimumLineSpacing = 1
		flowlayout.minimumInteritemSpacing = 1
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.backgroundColor =  UIColor.white
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.dataSource = self
		collectView.delegate = self
		collectView.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(collectView)
		collectView.snp.makeConstraints({ (make) in
 			make.bottom.left.right.equalToSuperview()
			make.top.equalTo(50)
		})
		
		
	}
	
}

extension  GSMineServeTabCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return titles.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		for view in cell.contentView.subviews {
			view.removeFromSuperview()
		}
		
 
		let icon:UIImageView = gigaImageView("icon_" + icons[indexPath.row],nil,nil,nil)
 		cell.contentView.addSubview(icon)
		icon.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(15)
			make.centerX.equalToSuperview()
			make.height.equalTo(Constant.screenWidth / 10)
		}
		
 		let	title:UILabel = gigaLabel(titles[indexPath.row],15,nil,nil)
		cell.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.equalTo(icon.snp.left)
			make.top.equalTo(icon.snp.bottom)
			make.right.equalTo(icon.snp.right)
			make.height.equalTo(40)
		}
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		switch indexPath.row {
		case 0:
			let collectionVC = GSMineCollectionController()
			collectionVC.hidesBottomBarWhenPushed = true
			collectionVC.title = "商品收藏"
		    viewForController(view: self)?.navigationController?.pushViewController(collectionVC, animated: true)
			
		default:
			break
		}
	}
	
	
}
