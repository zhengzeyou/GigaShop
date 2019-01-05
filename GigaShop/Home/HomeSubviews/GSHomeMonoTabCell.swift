//
//  GSHomeMonoTableViewCell.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/12.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Kingfisher

class GSHomeMonoTabCell: UITableViewCell {
	var collectView:UICollectionView!
	let title:UILabel = UILabel()
	var data:NSArray = []
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
 	private func addSubviews(){
		
		title.text = "人气单品".localized()
 		self.contentView.addSubview(title)
		title.snp.makeConstraints {
			$0.left.equalToSuperview().offset(15)
			$0.top.equalToSuperview().offset(10)
		}
		
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width:  Constant.screenWidth / 3.0 + 10, height: Constant.screenWidth / 3.0 + 100)
		flowlayout.minimumLineSpacing = 2
		flowlayout.minimumInteritemSpacing = 2
		flowlayout.scrollDirection = .horizontal
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.backgroundColor =  UIColor.white
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.dataSource = self
		collectView.delegate = self
		collectView.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(collectView)
		collectView.snp.makeConstraints({
			$0.left.equalTo(10)
			$0.right.bottom.equalToSuperview()
 			$0.height.equalTo( Constant.screenWidth / 3.0 + 100)
		})
		
		
	}
	
}

extension GSHomeMonoTabCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		for view in cell.contentView.subviews {
			view.removeFromSuperview()
		}
 		let logo:UIImageView = UIImageView()
 		cell.contentView.addSubview(logo)
		logo.snp.makeConstraints {
			$0.top.left.equalToSuperview()
			$0.right.equalTo(-2)
			$0.height.equalTo(Constant.screenWidth / 3.0 + 10)
		}
 		logo.kf.setImage(with: URL(string: "https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1542007443&di=e0c7b5cd274f8624149d5c1fa59d32af&src=http://m.360buyimg.com/mobilecms/s750x750_jfs/t9382/255/419174577/214784/f9026ac4/59aa5039N3b06738b.jpg!q80.jpg"))
		
		let title:UILabel = UILabel()
 		title.font = UIFont.systemFont(ofSize: 15)
		title.textColor = Constant.blackColor
 		title.text = "COACH豆蔻迟女包经典波士顿包奢侈品"
		title.numberOfLines = 0
 		cell.contentView.addSubview(title)
		title.snp.makeConstraints {
			$0.left.equalTo(logo.snp.left)
			$0.top.equalTo(logo.snp.bottom).offset(5)
			$0.right.equalTo(logo.snp.right)
			$0.height.equalTo(40)
 		}
		
		let price:UILabel = UILabel()
		price.textColor = Constant.redColor
		price.text = "￥1800.00"
 		price.font = UIFont.systemFont(ofSize: 15)
 		cell.contentView.addSubview(price)
		price.snp.makeConstraints {
			$0.left.equalTo(logo.snp.left)
			$0.top.equalTo(title.snp.bottom).offset(10)
			$0.right.equalTo(logo.snp.right)
			$0.height.equalTo(15)
		}
		
		return cell
	}
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let goodDetailVC:GSGoodDetailedMainController = GSGoodDetailedMainController()
		goodDetailVC.hidesBottomBarWhenPushed = true
		self.viewForController(view: self)?.navigationController?.pushViewController(goodDetailVC, animated: true)
		
	}

	
	
}
