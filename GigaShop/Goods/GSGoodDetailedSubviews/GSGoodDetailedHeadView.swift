//
//  GSGoodDetailedHeadView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/16.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodDetailedHeadView: UIView {
	var headcollectView:UICollectionView!
	var buttomLine:UILabel!
	let titles:[String] = ["商品".localized(),"评价".localized(),"详情".localized()]
	var clickIndexMap:((Int) -> Void)?

	var currentIndex:Int?{
		didSet{
			self.moveClosure(indexs: self.currentIndex!)
		}
	}
	override init(frame: CGRect) {
		self.currentIndex = 0
		super.init(frame: frame)
		Subviews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func Subviews(){
 		//上方的表
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: 50 , height: 40)
		flowlayout.minimumLineSpacing = 3
		flowlayout.minimumInteritemSpacing = 3
		
		headcollectView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 160, height: 40), collectionViewLayout: flowlayout)
 		headcollectView.tag = 1001
		headcollectView.layer.backgroundColor = UIColor.clear.cgColor
 		headcollectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		headcollectView.dataSource = self
		headcollectView.delegate = self
 		headcollectView.showsHorizontalScrollIndicator = false
		self.addSubview(headcollectView)
		
		buttomLine = UILabel(frame: CGRect(x: 11.5, y: 37.0, width: 30.0, height: 2.0))
		buttomLine.backgroundColor = Constant.redColor
		self.addSubview(buttomLine)
 
 	}
	
	private func moveClosure(indexs:Int){
		UIView.animate(withDuration: 0.3) {
			var frame:CGRect = self.buttomLine.frame
			frame.origin.x = 11.5 + 53.5 * CGFloat(indexs)
			self.buttomLine.frame = frame
		}
		
		for i in 0 ... 2 {
			
			let index:IndexPath = IndexPath(item: i, section: 0)
			let cell:UICollectionViewCell = headcollectView.cellForItem(at: index)!
			let title:UILabel = cell.viewWithTag(index.row + 1) as! UILabel
			title.textColor = Constant.blackColor
			
		}
		let indexPath:IndexPath = IndexPath(item:indexs, section: 0)
		let cell:UICollectionViewCell = headcollectView.cellForItem(at: indexPath)!
		let title:UILabel = cell.viewWithTag(indexs + 1) as! UILabel
		title.textColor = Constant.redColor
		
	}

}

extension GSGoodDetailedHeadView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
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
		title.snp.makeConstraints { 
			$0.center.equalToSuperview()
		}
		return cell
	}
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if collectionView.tag == 1001 {
		
			self.moveClosure(indexs: indexPath.row)
 
			guard self.clickIndexMap != nil else {
				return
			}
			self.clickIndexMap!(indexPath.row)
		}
	}

}
