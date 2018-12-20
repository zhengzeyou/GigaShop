//
//  GSMineManuOrderTableViewCell.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/18.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit

class GSMineCollectionTableCell: UITableViewCell {
	var imageview:UIImageView!
	var contentLab:UILabel!
	var curentPrice:UILabel!
	var marketPrice:UILabel!
	var checkBtn:UIButton!
	var changeCount:((Int) -> Void)!
	var isEdited:Bool? {
		didSet{
			UIView.animate(withDuration: 1) {
				
				switch self.isEdited {
 				case true:
					self.imageview.snp.updateConstraints {
						$0.left.equalTo(50)
					}
 					break
 				case false:
 					self.imageview.snp.updateConstraints {
 						$0.left.equalTo(20)
				
					}
 					break
				case .none:
					break
				case .some(_):
					break
				}
		
			}

		}
	}
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews()
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	private func addSubviews(){
		
		checkBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
		checkBtn.setImage(gigaImg("icon_cart_unselected"), for: .normal)
		checkBtn.setImage(gigaImg("icon_cart_selected"), for: .selected)
  		checkBtn.addTarget(self, action: #selector(choice), for:.touchUpInside )
		contentView.addSubview(checkBtn)
		checkBtn.snp.makeConstraints {
			$0.centerY.equalToSuperview()
			$0.width.height.equalTo(15)
			$0.left.equalTo(20)

		}
		
		imageview = UIImageView()
		contentView.addSubview(imageview)
		imageview.snp.makeConstraints {
			$0.bottom.equalToSuperview()
			$0.top.left.equalTo(20)
			$0.width.equalTo(120)
		}
		imageview.layer.borderWidth = 1
		imageview.layer.borderColor = Constant.vcBgColor.cgColor
		imageview.kf.setImage(with: URL(string: "https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBhTF7Fo4uif_!!4120736425.jpg"))
		
		contentLab = UILabel()
		contentLab.text = "碧蒙萱 bioemsan 非离子迷迭洁面乳150ml"
		contentLab.textColor = Constant.blackColor
		contentLab.numberOfLines = 0
		contentView.addSubview(contentLab)
		contentLab.snp.makeConstraints {
			$0.top.equalTo(imageview.snp.top)
			$0.left.equalTo(imageview.snp.right).offset(10)
			$0.right.equalTo(-15)
		}
		
		
		curentPrice = UILabel()
		curentPrice.text = "￥7199.00"
 		curentPrice.textColor = Constant.redColor
		contentView.addSubview(curentPrice)
		curentPrice.snp.makeConstraints {
			$0.left.equalTo(contentLab.snp.left)
			$0.bottom.equalTo(imageview.snp.bottom).offset(-10)
		}

		marketPrice = UILabel()
		marketPrice.textColor = Constant.greyColor
		contentView.addSubview(marketPrice)
		marketPrice.snp.makeConstraints {
			$0.left.equalTo(curentPrice.snp.right).offset(10)
			$0.bottom.equalTo(imageview.snp.bottom).offset(-10)
		}
		let priceString = NSMutableAttributedString.init(string: "￥7399.00")
		priceString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSNumber.init(value: 1), range: NSRange(location: 0, length: priceString.length))
		marketPrice.attributedText = priceString

	}
	
	@objc func choice(sender:UIButton){
		sender.isSelected = !sender.isSelected
		
	}
	
	func setSenderIsSelectState(isSelected:Bool){
		checkBtn.isSelected = isSelected
	}

}
