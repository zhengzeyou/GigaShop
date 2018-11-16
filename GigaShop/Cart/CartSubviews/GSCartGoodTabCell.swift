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
	var goodname:UILabel!
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
		self.selectionStyle = .none

		checkbtn = UIButton()
		checkbtn.setImage(UIImage(named: "icon_cart_unselected"), for: .normal)
		checkbtn.setImage(UIImage(named: "icon_cart_selected"), for: .selected)
		checkbtn.addTarget(self, action: #selector(checkaction), for: .touchUpInside)
		self.contentView.addSubview(checkbtn)
		checkbtn.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.width.height.equalTo(20)
			make.left.equalTo(15)

 		}
		
		picture = UIImageView()
		picture.contentMode = .scaleAspectFit
		picture.layer.cornerRadius = 3
		picture.layer.masksToBounds = true
		picture.layer.borderColor = Constant.vcBgColor.cgColor
		picture.layer.borderWidth = 1
		self.contentView.addSubview(picture)
		picture.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.left.equalTo(checkbtn.snp.right).offset(10)
			make.width.height.equalTo(90)
		}
		
		
		goodname = UILabel()
		goodname.textColor = Constant.blackColor
		self.contentView.addSubview(goodname)
		goodname.snp.makeConstraints { (make) in
			make.left.equalTo(picture.snp.right).offset(15)
			make.top.equalTo(picture.snp.top)
			make.height.equalTo(30)
			make.right.equalTo(-20)
		}
		
		goodprice = UILabel()
 		goodprice.textColor = Constant.blackColor
		self.contentView.addSubview(goodprice)
		goodprice.snp.makeConstraints { (make) in
			make.left.equalTo(goodname.snp.left)
			make.top.equalTo(goodname.snp.bottom)
			make.height.equalTo(30)
			make.right.equalTo(-20)
		}

		
	    let del:UIImageView = UIImageView(image: UIImage(named: "icon_delete_goods"))
		del.isUserInteractionEnabled = true
		let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
		del.addGestureRecognizer(tap)
		del.contentMode = .scaleAspectFit
		self.contentView.addSubview(del)
		del.snp.makeConstraints { (make) in
			make.bottom.equalTo(picture.snp.bottom)
			make.right.equalTo(-15)
			make.width.height.equalTo(15)
		}
		
 		count.setNumberText(nums: 1)
		count.changeNumber = {(num:Int) -> Void in
			self.num = num
			guard self.changeCount != nil&&self.checkbtn.isSelected else {
				return
			}
			self.changeCount(self.num!)
  		}
		self.contentView.addSubview(count)
		count.snp.makeConstraints { (make) in
			make.left.equalTo(goodname.snp.left)
 			make.width.equalTo(90)
			make.height.equalTo(30)
			make.bottom.equalTo(-10)
		}
		
		
		

	}
	@objc func tapAction(gesture:UITapGestureRecognizer){
		
	}
	
	func setSenderIsSelectState(isSelected:Bool){
		self.checkbtn.isSelected = isSelected
		guard self.changeCount != nil else {
			return
		}
		self.changeCount(isSelected ? num! : 0)
	}
	
	@objc func checkaction(sender:UIButton){
		sender.isSelected = !sender.isSelected
		guard self.changeCount != nil else {
			return
		}
		self.changeCount(sender.isSelected ? num! : 0)
		

	}
}
