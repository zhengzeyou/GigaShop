//
//  GSGoodPicBrowerView.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/20.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import PhotoBrowserSwift

class GSGoodPicBrowerView: UIView {
	var picCollectView:UICollectionView!
	var dataArray:[String] = ["https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBi7jHemi8BP_!!0-item_pic.jpg", "https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBhTF7Fo4uif_!!4120736425.jpg","https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhB4WccycS4Ym_!!4120736425.jpg"]

	override init(frame: CGRect) {
		super.init(frame: frame)
		SubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func SubViews(){
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/3.0 - 20.0 , height: Constant.screenWidth/3.0 - 20.0 )
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		
		picCollectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		picCollectView.backgroundColor = UIColor.white
		picCollectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		picCollectView.dataSource = self
		picCollectView.delegate = self
		picCollectView.showsHorizontalScrollIndicator = false
		self.addSubview(picCollectView )
		
		var sections:Int?
		sections = Int(self.dataArray.count / 3)
		if self.dataArray.count % 3 != 0 {
			sections = sections! + 1
		}
		
		picCollectView?.snp.makeConstraints({ 
			$0.edges.equalToSuperview()
		})

	}

	public func PhotoBrowers(index:Int,photos:NSMutableArray){
		let pbVC:PhotoBrowser = PhotoBrowser.init(photos: photos as! [Photo], currentIndex: index)
		self.viewForController(view: self)?.present(pbVC, animated: true, completion: nil)
		
	}
	
}

extension GSGoodPicBrowerView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return self.dataArray.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		
		let bg:UIView = UIView()
 		cell.contentView.addSubview(bg)
		bg.snp.makeConstraints { 
			$0.left.top.equalToSuperview().offset(5)
			$0.right.bottom.equalToSuperview().offset(-5)
			
		}
		let icon:UIImageView = UIImageView()
		bg.addSubview(icon)
		icon.snp.updateConstraints { 
			$0.edges.equalToSuperview()
		}
		icon.kf.setImage(with:URL(string:self.dataArray[indexPath.row])!)
		
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let photos:NSMutableArray = []
		for i in 0 ..< self.dataArray.count {
			let photo:Photo = Photo(url: URL(string: self.dataArray[i]))
			photos.add(photo)
		}
		PhotoBrowers(index: indexPath.row, photos: photos)
	}
	
}

