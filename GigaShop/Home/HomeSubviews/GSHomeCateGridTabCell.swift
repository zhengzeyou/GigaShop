//
//  GSHomeCateGridTabCell.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/12.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Alamofire

class GSHomeCateGridTabCell: UITableViewCell {
	
	var data:NSArray!
	let images:[String] = ["clothing","bags","baby","fruits","commodity","sports","furniture","electronics","house_e","more"]
	let titles:[String] = ["潮流服装".localized(),"箱包配饰".localized(),"母婴用品".localized(),"水果时蔬".localized(),"家具用品".localized(),"运动装备".localized(),"家居家饰".localized(),"数码电子".localized(),"家用电器".localized(),"更多分类".localized()]

	var collectView:UICollectionView!
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.data = []
		addSubViews()
 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func addSubViews(){
		
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: (Constant.screenWidth - 10)/5.0 , height: (Constant.screenWidth - 10)/5.0)
		flowlayout.minimumLineSpacing = 1
		flowlayout.minimumInteritemSpacing = 1
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.backgroundColor = UIColor.white
		collectView.showsVerticalScrollIndicator = false
		collectView.isScrollEnabled = false
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.dataSource = self
		collectView.delegate = self
		collectView.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(collectView)
		collectView.snp.makeConstraints { 
			$0.left.bottom.right.equalToSuperview()
			$0.top.equalTo(30)
		}
		
	}
}

extension GSHomeCateGridTabCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 10
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
 
  		let avator:UIImageView = UIImageView()
		cell.contentView.addSubview(avator)
		avator.snp.updateConstraints {
			$0.centerY.equalTo(20)
 			$0.centerX.equalToSuperview()
			$0.height.width.equalTo((Constant.screenWidth - 10)/10.0)
 		}
		avator.image = gigaImg("icon_category_" + images[indexPath.row])
//		 gigaImg( "icon_category_" + images[indexPath.row])
		
		let name:UILabel = UILabel()
		name.textColor = Constant.blackColor
		name.font = .systemFont(ofSize: 12)
		name.text = titles[indexPath.row]
 		cell.contentView.addSubview(name)
		name.snp.makeConstraints {
 			$0.centerX.equalToSuperview()
			$0.top.equalTo(avator.snp.bottom)
			
		}
		
 
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if indexPath.row != (titles.count - 1) {
			let cateList:GSCategoryListController = GSCategoryListController()
			cateList.hidesBottomBarWhenPushed = true
			self.viewForController(view: self)?.navigationController?.pushViewController(cateList, animated: true)
		}
  	}
 }


