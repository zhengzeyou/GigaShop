//
//  GSMineOrderStateTabCell.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/13.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Kingfisher

class  GSMineOrderStateTabCell: UITableViewCell {
	var collectView:UICollectionView!
	var data:NSArray = []
	let titles:[String] = ["待付款","待发货","待收货","评价","退货/售后"]
	let icons:[String] = ["icon_awaiting_payment","icon_awaiting_delivery","icon_awaiting_receive","icon_order_evaluate","icon_after_sale"]

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews(){
		
		let title:UILabel = UILabel()
 		title.text = "我的订单"
		title.font = .systemFont(ofSize: 22)
		self.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(15)
			make.top.equalToSuperview().offset(10)
		}
		
		let icon:UIImageView = UIImageView(image: UIImage(named: "icon_arrow_all_order")?.withRenderingMode(.alwaysOriginal))
		icon.contentMode = .scaleAspectFit
		self.contentView.addSubview(icon)
		icon.snp.makeConstraints { (make) in
			make.centerY.equalTo(title.snp.centerY)
			make.width.height.equalTo(14)
			make.right.equalTo(-15)
		}
 
		
		let allbtn:UIButton = UIButton()
		allbtn.setTitle("查看全部", for: .normal)
		allbtn.setTitleColor( Constant.greyColor, for: .normal)
		self.contentView.addSubview(allbtn)
		allbtn.snp.makeConstraints { (make) in
 			make.right.equalTo(icon.snp.left)
			make.centerY.equalTo(title.snp.centerY)
			make.width.equalTo(80)
			make.height.equalTo(20)
		}

		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width:  Constant.screenWidth / 5.0 - 10.0, height: Constant.screenWidth / 5.0 - 10.0 )
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
			make.left.equalTo(10)
			make.right.equalTo(-10)
			make.bottom.equalToSuperview()
			make.top.equalTo(50)
		})
		
		
	}
	
}

extension  GSMineOrderStateTabCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		for view in cell.contentView.subviews {
			view.removeFromSuperview()
		}
		
		let icon:UIImageView = UIImageView(image: UIImage(named: icons[indexPath.row])?.withRenderingMode(.alwaysOriginal))
		icon.contentMode = .scaleAspectFit
		cell.contentView.addSubview(icon)
		icon.snp.makeConstraints { (make) in
			make.top.equalToSuperview()
			make.centerX.equalToSuperview()
			make.height.equalTo(Constant.screenWidth / 12)
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
