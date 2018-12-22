//
//  GSCartGoodTabCell.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/13.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Kingfisher

class GSCartGoodTabCell: UITableViewCell {
	var picture:UIImageView!
	var goodname:QMUILabel!
	var goodprice:UILabel!
 	let count:GSCartCountView = GSCartCountView()
	var num:Int?
 	var changeCount:((Int) -> Void)!
	var indexpath:IndexPath?
	var checkbtn:UIButton!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
  		addSubviews()
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	func setGoodData(dic:NSDictionary){

		picture.kf.setImage(with: URL(string: dic.object(forKey: "goodurl") as! String))
		goodname.text = dic.object(forKey: "goodname") as? String
		let price:String = dic.object(forKey: "goodprice") as! String
		goodprice.text = "￥" + price
		num = dic.object(forKey: "goodNum") as? Int
		count.setNumberText(nums:num!)

	}
	fileprivate func addSubviews(){
		selectionStyle = .none

		checkbtn = UIButton()
		checkbtn.setImage( gigaImg( "icon_cart_unselected"), for: .normal)
		checkbtn.setImage( gigaImg( "icon_cart_selected"), for: .selected)
		checkbtn.addTarget(self, action: #selector(checkaction), for: .touchUpInside)
		contentView.addSubview(checkbtn)
		checkbtn.snp.makeConstraints { 
			$0.centerY.equalToSuperview()
			$0.width.height.equalTo(20)
			$0.left.equalTo(15)

 		}
		
		picture = UIImageView()
		picture.contentMode = .scaleAspectFit
		picture.layer.cornerRadius = 3
		picture.layer.masksToBounds = true
		picture.layer.borderColor = Constant.vcBgColor.cgColor
		picture.layer.borderWidth = 1
		contentView.addSubview(picture)
		picture.snp.makeConstraints { 
			$0.centerY.equalToSuperview()
			$0.left.equalTo(checkbtn.snp.right).offset(10)
			$0.width.height.equalTo(90)
		}
		
		
		goodname = QMUILabel()
		goodname.canPerformCopyAction = true
		goodname.textColor = Constant.blackColor
		contentView.addSubview(goodname)
		goodname.snp.makeConstraints { 
			$0.left.equalTo(picture.snp.right).offset(15)
			$0.top.equalTo(picture.snp.top)
			$0.height.equalTo(30)
			$0.right.equalTo(-20)
		}
		
		
		goodprice = UILabel()
 		goodprice.textColor = Constant.blackColor
		contentView.addSubview(goodprice)
		goodprice.snp.makeConstraints { 
			$0.left.equalTo(goodname.snp.left)
			$0.top.equalTo(goodname.snp.bottom)
			$0.height.equalTo(30)
			$0.right.equalTo(-20)
		}

		
	    let del:UIImageView = UIImageView(image:  gigaImg( "icon_delete_goods"))
		del.isUserInteractionEnabled = true
		let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
		del.addGestureRecognizer(tap)
		del.contentMode = .scaleAspectFit
		contentView.addSubview(del)
		del.snp.makeConstraints { 
			$0.bottom.equalTo(picture.snp.bottom)
			$0.right.equalTo(-15)
			$0.width.height.equalTo(15)
		}
		
		count.mode = .showGrid
  		count.setNumberText(nums: 1)
 		count.changeNumber = {(num:Int) -> Void in
			self.num = num
			guard self.changeCount != nil&&self.checkbtn.isSelected else {
				return
			}
			self.changeCount(self.num!)
  		}
		contentView.addSubview(count)
		count.snp.makeConstraints { 
			$0.left.equalTo(goodname.snp.left)
 			$0.width.equalTo(90)
			$0.height.equalTo(30)
			$0.bottom.equalTo(-10)
		}
		
		

	}
	
	@objc func tapAction(gesture:UITapGestureRecognizer){
		let alert = UIAlertController(title: "删除该商品？", message: nil, preferredStyle: .alert)
		let sure = UIAlertAction(title: "是", style: .default) { (action) in
 		}
  		let cancel = UIAlertAction(title: "否", style: .cancel, handler: nil)
 		alert.addAction(cancel)
		alert.addAction(sure)
		
		viewForController(view: self)?.present(alert, animated: true, completion: nil)
		
	}
	
	func setSenderIsSelectState(isSelected:Bool){
		checkbtn.isSelected = isSelected
		guard self.changeCount != nil else {
			return
		}
		changeCount(isSelected ? num! : 0)
	}
	
	@objc func checkaction(sender:UIButton){
		sender.isSelected = !sender.isSelected
		guard changeCount != nil else {
			return
		}
		changeCount(sender.isSelected ? num! : 0)
		

	}
}
