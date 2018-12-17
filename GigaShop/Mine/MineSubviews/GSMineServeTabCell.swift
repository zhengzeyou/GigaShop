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
		
		let title:UILabel = UILabel()
		title.text = "我的服务"
		title.font = .systemFont(ofSize: 20)
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
		
		let icon:UIImageView = UIImageView(image:  gigaImg("icon_" + icons[indexPath.row]))
		icon.contentMode = .scaleAspectFit
		cell.contentView.addSubview(icon)
		icon.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(15)
			make.centerX.equalToSuperview()
			make.height.equalTo(Constant.screenWidth / 10)
		}
		
		let title:UILabel = UILabel()
		title.font = UIFont.systemFont(ofSize: 15)
		title.textColor = Constant.blackColor
		title.text = titles[indexPath.row]
		title.numberOfLines = 2
		cell.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.equalTo(icon.snp.left)
			make.top.equalTo(icon.snp.bottom)
			make.right.equalTo(icon.snp.right)
			make.height.equalTo(40)
		}
		
		
		return cell
	}
	
	
	
}
