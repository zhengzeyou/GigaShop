//
//  GSCateValueTabCell.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/13.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCateValueTabCell: UITableViewCell {
	var title:UILabel!
	var collectView:UICollectionView!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     }
	
	private func addSubviews(){
		self.backgroundColor = UIColor.colorFromHex(hex: 0xf2f4f6)
		let bg:UIView = UIView()
		bg.layer.cornerRadius = 5
		bg.layer.masksToBounds = true
		bg.backgroundColor = UIColor.white
		self.addSubview(bg)
		bg.snp.makeConstraints { (make) in
			make.left.top.right.equalToSuperview()
			make.bottom.equalTo(-10)
		}
		
		title = UILabel()
		title.text = "男装"
		bg.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.top.height.equalTo(15)
		}
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/4 - 15, height:3*Constant.screenWidth/8 - 33)
		flowlayout.minimumLineSpacing = 1
		flowlayout.minimumInteritemSpacing = 1
		flowlayout.scrollDirection = .vertical
		
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.backgroundColor =  UIColor.white
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.dataSource = self
		collectView.delegate = self
		collectView.isScrollEnabled = false
		bg.addSubview(collectView)
		collectView.snp.makeConstraints({ (make) in
 			make.left.equalTo(10)
			make.bottom.equalToSuperview()
			make.right.equalTo(-10)
			make.top.equalTo(title.snp.bottom).offset(15)
		})
  	}
 }

extension GSCateValueTabCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		
		for view in cell.contentView.subviews {
			view.removeFromSuperview()
		}
		let logo:UIImageView = UIImageView()
		cell.contentView.addSubview(logo)
		logo.snp.makeConstraints { (make) in
			make.top.centerX.equalToSuperview()
 			make.height.width.equalTo(Constant.screenWidth/4 - 30)
		}
		logo.kf.setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542097015350&di=e5176001fb939f1ccf908f4289aefd7e&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D1f6841e845c2d562e605d8ae8f78fa9a%2F8435e5dde71190efd0967d57c41b9d16fcfa60cd.jpg"))

		let title:UILabel = UILabel()
		title.font = UIFont.systemFont(ofSize: 15)
		title.textColor = Constant.blackColor
		title.text = "衣服"
		title.textAlignment = .center
		title.numberOfLines = 2
		cell.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.equalTo(logo.snp.left)
			make.top.equalTo(logo.snp.bottom).offset(5)
			make.right.equalTo(logo.snp.right)
			make.height.equalTo(20)
		}

		return cell
	}
	
	
}
