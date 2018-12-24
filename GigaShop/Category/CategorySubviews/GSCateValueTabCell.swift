//
//  GSCateValueTabCell.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/13.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Kingfisher.Swift

class GSCateValueTabCell: UITableViewCell {
	var title:UILabel!
	var collectView:UICollectionView!
	var cateValueItems:[itemlevelModel] = [itemlevelModel]()
	var titlemodel:itemlevelModel?
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	func reloadWithCateValueItemsModel(item1:[itemlevelModel],item2:itemlevelModel){
		cateValueItems = item1
		titlemodel = item2
		title.text = titlemodel?.level_name
 		collectView.reloadData()
	}


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     }
	
	private func addSubviews(){
		self.backgroundColor =  Constant.vcBgColor
		let bg:UIView = UIView()
		bg.layer.cornerRadius = 5
		bg.layer.masksToBounds = true
		bg.backgroundColor = UIColor.white
		self.addSubview(bg)
		bg.snp.makeConstraints { 
			$0.left.top.right.equalToSuperview()
			$0.bottom.equalTo(-10)
		}
		
		title = UILabel()
		bg.addSubview(title)
		title.snp.makeConstraints { 
			$0.left.top.height.equalTo(15)
		}
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/4 - 15, height:3*Constant.screenWidth/8 - 30)
		flowlayout.minimumLineSpacing = 1
		flowlayout.minimumInteritemSpacing = 1
		flowlayout.scrollDirection = .vertical
		
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.backgroundColor =  .white
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.dataSource = self
		collectView.delegate = self
		collectView.isScrollEnabled = false
		bg.addSubview(collectView)
		collectView.snp.makeConstraints({ 
 			$0.left.equalTo(10)
			$0.bottom.equalToSuperview()
			$0.right.equalTo(-10)
			$0.top.equalTo(title.snp.bottom).offset(15)
		})
  	}
 }

extension GSCateValueTabCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cateValueItems.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		
		for view in cell.contentView.subviews {
			view.removeFromSuperview()
		}
		let itemmodel = cateValueItems[indexPath.row]
		let logo:AnimatedImageView = AnimatedImageView()
		logo.contentMode = .scaleAspectFit
		cell.contentView.addSubview(logo)
		logo.snp.makeConstraints { 
			$0.top.centerX.equalToSuperview()
 			$0.height.width.equalTo(Constant.screenWidth/4 - 30)
		}
		
		logo.kf.setImage(with: URL(string:itemmodel.image_url! ),placeholder: defaultImage)

		let title:UILabel = UILabel()
		title.font = .systemFont(ofSize: 12)
		title.textColor = Constant.blackColor
		title.text = itemmodel.level_name
		title.textAlignment = .center
		title.numberOfLines = 2
		cell.contentView.addSubview(title)
		title.snp.makeConstraints { 
			$0.top.equalTo(logo.snp.bottom).offset(5)
			$0.centerX.equalToSuperview()
		}

		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cateList:GSCategoryListController = GSCategoryListController()
		cateList.hidesBottomBarWhenPushed = true
		viewForController(view: self)?.navigationController?.pushViewController(cateList, animated: true)

	}
	
	
}
