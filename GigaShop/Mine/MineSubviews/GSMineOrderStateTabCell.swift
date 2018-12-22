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
		self.selectionStyle = .none
		addSubviews()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews(){
		
		let title:UILabel = UILabel()
 		title.text = "我的订单"
		title.font = .systemFont(ofSize: 17)
		self.contentView.addSubview(title)
		title.snp.makeConstraints {
			$0.left.equalToSuperview().offset(15)
			$0.top.equalToSuperview().offset(10)
		}
		
		let icon:UIImageView = UIImageView(image:gigaImg( "icon_arrow_all_order"))
		icon.contentMode = .scaleAspectFit
		self.contentView.addSubview(icon)
		icon.snp.makeConstraints {
			$0.centerY.equalTo(title.snp.centerY)
			$0.width.height.equalTo(14)
			$0.right.equalTo(-10)
		}
 
		
		let allbtn:UIButton = UIButton()
 		allbtn.setTitle("查看全部", for: .normal)
		allbtn.titleLabel?.font = .systemFont(ofSize: 14)
		allbtn.titleLabel?.textAlignment = .right
		allbtn.setTitleColor( Constant.greyColor, for: .normal)
		allbtn.addTarget(self, action: #selector(allOrders), for: .touchUpInside)
		self.contentView.addSubview(allbtn)
		allbtn.snp.makeConstraints {
 			$0.right.equalTo(icon.snp.left)
			$0.centerY.equalTo(title.snp.centerY)
			$0.width.equalTo(60)
			$0.height.equalTo(20)
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
		collectView.snp.makeConstraints({
			$0.left.equalTo(10)
			$0.right.equalTo(-10)
			$0.bottom.equalToSuperview()
			$0.top.equalTo(50)
		})
		
		
	}
	
}

extension GSMineOrderStateTabCell{
	@objc private func allOrders(sender:UIButton){
	
		let order = GSMineParentOrderController()
		order.hidesBottomBarWhenPushed = true
		order.title = "全部订单"
		viewForController(view: self)?.navigationController?.pushViewController(order, animated: true)
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
		
		let icon:UIImageView = UIImageView(image: gigaImg(icons[indexPath.row]))
		icon.contentMode = .scaleAspectFit
		cell.contentView.addSubview(icon)
		icon.snp.makeConstraints {
			$0.top.equalToSuperview()
			$0.centerX.equalToSuperview()
			$0.height.equalTo(Constant.screenWidth / 12)
		}
 
		let title:UILabel = UILabel()
		title.font = UIFont.systemFont(ofSize: 15)
		title.textColor = Constant.blackColor
		title.text = titles[indexPath.row]
		title.numberOfLines = 2
		cell.contentView.addSubview(title)
		title.snp.makeConstraints {
			$0.left.equalTo(icon.snp.left)
			$0.top.equalTo(icon.snp.bottom)
			$0.right.equalTo(icon.snp.right)
			$0.height.equalTo(40)
		}
		
 
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let vc = GSMineAllOrderController()
		vc.navigationItem.title = titles[indexPath.row]
	    viewForController(view: self)?.navigationController?.pushViewController(vc, animated: true)
	}
	
	
}
