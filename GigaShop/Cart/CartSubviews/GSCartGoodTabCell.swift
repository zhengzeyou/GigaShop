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
	

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	fileprivate func addSubviews(){
		
		let checkbtn:UIButton = UIButton()
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
		
		picture.kf.setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542097015350&di=e5176001fb939f1ccf908f4289aefd7e&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D1f6841e845c2d562e605d8ae8f78fa9a%2F8435e5dde71190efd0967d57c41b9d16fcfa60cd.jpg"))
		
		goodname = UILabel()
		goodname.text = "COACH豆蔻迟女包经典波士顿包奢侈品"
		goodname.textColor = Constant.blackColor
		self.contentView.addSubview(goodname)
		goodname.snp.makeConstraints { (make) in
			make.left.equalTo(picture.snp.right).offset(15)
			make.top.equalTo(picture.snp.top)
			make.height.equalTo(30)
			make.right.equalTo(-20)
		}
		
		goodprice = UILabel()
		goodprice.text = "￥1899.00"
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
		
		
		

	}
	@objc func tapAction(gesture:UITapGestureRecognizer){
		
	}
	
	@objc func checkaction(sender:UIButton){
		sender.isSelected = !sender.isSelected
	}
}
