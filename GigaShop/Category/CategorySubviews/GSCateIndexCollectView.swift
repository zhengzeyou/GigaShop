//
//  GSCateIndexCollectView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/12.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
protocol GSCateIndexCollectViewDelegate : class {
	func GSCateIndexCollectViewDidSelectedItemAtIndex(_ index : NSInteger) -> ()
}
class GSCateIndexCollectView: UIView {
	var collectView:UICollectionView!
	let titles:[String] = ["潮流服装","箱包配饰","母婴用品","水果时蔬","家具用品","运动装备","家居家饰","数码电子","家用电器","更多分类"]
 	weak var delegate : GSCateIndexCollectViewDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
 	}
	override func layoutSubviews() {
		super.layoutSubviews()
		addSubviews()

	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	private func addSubviews(){
		self.backgroundColor = UIColor.white

 		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width:Constant.screenWidth/4.0, height:60.0)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
 		flowlayout.scrollDirection = .vertical
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.backgroundColor =  UIColor.white
 		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.dataSource = self
		collectView.delegate = self
		
		let defaultSelectCell = IndexPath(row: 0, section: 0)
		collectView.selectItem(at: defaultSelectCell, animated: true, scrollPosition: UICollectionView.ScrollPosition.top)
  		self.addSubview(collectView)
		collectView.snp.makeConstraints({ (make) in
 			make.edges.equalToSuperview()
		})
		
		
	}
	
}

extension GSCateIndexCollectView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return titles.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
 
		let selectview:UIView = UIView()
		selectview.backgroundColor = UIColor.colorFromHex(hex: 0xf2f4f6)
		cell.selectedBackgroundView = selectview
		
		let redline:UIView = UIView()
		redline.backgroundColor = Constant.redColor
		selectview.addSubview(redline)
		redline.snp.makeConstraints { (make) in
			make.left.top.bottom.equalToSuperview()
			make.width.equalTo(4)
		}
		
  		let title:UILabel = UILabel()
 		title.textColor = Constant.blackColor
		title.text = titles[indexPath.row]
 		cell.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.center.equalToSuperview()
		}
		
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		delegate?.GSCateIndexCollectViewDidSelectedItemAtIndex(indexPath.row)

	}
	
}
