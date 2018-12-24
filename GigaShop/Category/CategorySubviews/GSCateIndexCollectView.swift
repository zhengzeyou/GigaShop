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
	var leftItemModels:[itemlevelModel] = [itemlevelModel]()
 	weak var delegate : GSCateIndexCollectViewDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		

 	}
	override func layoutSubviews() {
		super.layoutSubviews()

	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadWithManiLevelModel(items:[itemlevelModel]){
 
 		let _ = items.flatMap({(model) -> [itemlevelModel] in
			if model.level2 == "*" {
 				leftItemModels.append(model)
			}
 			return leftItemModels
		})
		addSubviews()

	}
	private func addSubviews(){
		self.backgroundColor = UIColor.white

 		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width:Constant.screenWidth/4.0, height:60.0)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
 		flowlayout.scrollDirection = .vertical
		
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
 		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.showsVerticalScrollIndicator = false
		collectView.backgroundColor =  .white
 		collectView.dataSource = self
		collectView.delegate = self
		
		let defaultSelectCell = IndexPath(row: 0, section: 0)
		collectView.selectItem(at: defaultSelectCell, animated: true, scrollPosition: UICollectionView.ScrollPosition.top)
  		self.addSubview(collectView)
		collectView.snp.makeConstraints({ 
 			$0.edges.equalToSuperview()
		})
		
		
	}
	
}

extension GSCateIndexCollectView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return leftItemModels.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
 
		let selectview:UIView = UIView()
		selectview.backgroundColor =  Constant.vcBgColor
		cell.selectedBackgroundView = selectview
		
		let redline:UIView = UIView()
		redline.backgroundColor = Constant.redColor
		selectview.addSubview(redline)
		redline.snp.makeConstraints { 
			$0.left.top.bottom.equalToSuperview()
			$0.width.equalTo(4)
		}
		
		let model = leftItemModels[indexPath.row]
  		let title:UILabel = UILabel()
 		title.textColor = Constant.blackColor
		title.text = model.level_name
 		cell.contentView.addSubview(title)
		title.snp.makeConstraints { 
			$0.center.equalToSuperview()
		}
		
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
		delegate?.GSCateIndexCollectViewDidSelectedItemAtIndex(indexPath.row)

	}
	
}
