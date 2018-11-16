//
//  GSGoodMiddleCollectView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/16.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodInfoTableCell: UITableViewCell {
	let titles:[String] = ["商品","评价","详情"]
	var collectView:UICollectionView!

	override init(frame: CGRect) {
		super.init(frame: frame)
		Subviews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func Subviews(){
		//上方的表
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth , height: Constant.screenHeight)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.tag = 1001
		collectView.layer.backgroundColor = UIColor.clear.cgColor
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.dataSource = self
		collectView.delegate = self
		collectView.showsHorizontalScrollIndicator = false
		self.addSubview(collectView)
		collectView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
	}
}

extension GSGoodInfoTableCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		
		let title:UILabel = UILabel()
		title.tag = indexPath.row + 1
		title.text = titles[indexPath.row]
		if indexPath.row == 0 {
			title.textColor = Constant.redColor
			
		}else{
			title.textColor = Constant.blackColor
			
		}
		cell.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.center.equalToSuperview()
		}
		return cell
	}
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 	}
	
}
