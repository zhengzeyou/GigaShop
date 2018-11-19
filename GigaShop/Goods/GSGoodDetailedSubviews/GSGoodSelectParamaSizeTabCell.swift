//
//  GSGoodSelectSizeCountView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodSelectParamaSizeTabCell: UITableViewCell {
	var param1CollectView:UICollectionView!
	var param2CollectView:UICollectionView!

	var collectionView:()->UICollectionView = {()->UICollectionView in
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width:(Constant.screenWidth - 30)/4.0-8, height:30.0)
		flowlayout.minimumLineSpacing = 8
		flowlayout.minimumInteritemSpacing = 8
		flowlayout.scrollDirection = .vertical
		
		let collectView:UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.backgroundColor =  UIColor.white
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
 

		return collectView
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		addSubviews()
		
	}

	
	
	private func addSubviews(){
 
		let param1title:UILabel = UILabel()
		param1title.text = "参数一"
		self.contentView.addSubview(param1title)
		param1title.snp.makeConstraints { (make) in
			make.top.left.height.equalTo(15)
		}
		
		param1CollectView = collectionView()
		param1CollectView.delegate = self
		param1CollectView.dataSource = self
		let defaultSelectCell = IndexPath(row: 0, section: 0)
		param1CollectView.selectItem(at: defaultSelectCell, animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
		self.contentView.addSubview(param1CollectView)
		param1CollectView.snp.makeConstraints { (make) in
			make.left.equalTo(param1title.snp.left)
			make.top.equalTo(param1title.snp.bottom).offset(10)
			make.right.equalTo(-15)
			make.height.equalTo(68)
		}
		
		let param2title:UILabel = UILabel()
		param2title.text = "参数二"
		self.contentView.addSubview(param2title)
		param2title.snp.makeConstraints { (make) in
			make.left.height.equalTo(15)
			make.top.equalTo(param1CollectView.snp.bottom).offset(15)
		}
		
		
		param2CollectView = collectionView()
		param2CollectView.delegate = self
		param2CollectView.dataSource = self
		self.contentView.addSubview(param2CollectView)
		param2CollectView.selectItem(at: defaultSelectCell, animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
		param2CollectView.snp.makeConstraints { (make) in
			make.left.equalTo(15)
			make.top.equalTo(param2title.snp.bottom).offset(10)
			make.right.equalTo(-15)
			make.height.equalTo(68)
		}

	}

}

extension GSGoodSelectParamaSizeTabCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		
		let unselectview:UIView = UIView()
		unselectview.layer.cornerRadius = 15
		unselectview.layer.masksToBounds = true
		unselectview.backgroundColor =  Constant.vcBgColor
		cell.backgroundView = unselectview
		
		let selectview:UIView = UIView()
		selectview.layer.cornerRadius = 15
		selectview.layer.masksToBounds = true
		selectview.backgroundColor =  Constant.redColor
 		cell.selectedBackgroundView = selectview
 
		let title:UILabel = UILabel()
   		title.textAlignment = .center
 		title.text = "规格选项"
		title.textColor = Constant.greyColor
  		title.tag = indexPath.row + 1
 		title.font = .systemFont(ofSize: 14)
 		cell.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
		if indexPath.row == 0 {
			title.textColor = UIColor.white

		}else{
			title.textColor = Constant.greyColor

		}
		
 

		return cell
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(indexPath.row)
		for i in 0...4 {
			let index:IndexPath = IndexPath(item: i, section: 0)
 			let cell:UICollectionViewCell = collectionView.cellForItem(at: index)!
			let title:UILabel = cell.viewWithTag(i + 1) as! UILabel
			title.textColor = Constant.greyColor

		}
		let cell:UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
		let title:UILabel = cell.viewWithTag(indexPath.row + 1) as! UILabel
 		title.textColor = UIColor.white
  	}
	
}
