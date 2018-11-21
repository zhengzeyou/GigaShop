//
//  GSGoodBuyAddShopCartView.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/19.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodBuyAddShopCartView: UIView {
	var addShopCart:UIButton!
	var goCart:UIButton!
	var goodCount:UILabel!
	var number:Int = 0
	override init(frame: CGRect) {
		super.init(frame: frame)
 		addSubViews()
 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		self.layer.borderColor = Constant.vcBgColor.cgColor
		self.layer.borderWidth = 0.5
		self.backgroundColor = UIColor.white
		let collection:UIButton = UIButton()
		collection.addTarget(self, action: #selector(btnaction), for: .touchUpInside)
		collection.tag = 101
 		collection.setImage(UIImage(named: "icon_bottom_collection"), for: .normal)
		collection.setTitle("收藏", for: .normal)
		collection.setTitleColor(Constant.blackColor, for: .normal)
		collection.titleLabel?.font = .systemFont(ofSize: 13)
 		self.addSubview(collection)
		collection.snp.makeConstraints { (make) in
			make.left.top.bottom.equalToSuperview()
			make.width.equalTo(Constant.screenWidth/6)
			
		}
		collection.titleEdgeInsets = UIEdgeInsets(top: (collection.imageView?.frame.size.height)!+15, left: -((collection.imageView?.bounds.size.width)!), bottom: 0,right: 0);
		collection.imageEdgeInsets = UIEdgeInsets(top: 0, left: (collection.titleLabel?.frame.size.width)!/2, bottom: (collection.titleLabel?.frame.size.height)!+10, right: -((collection.titleLabel?.frame.size.width)!)/2);

		
 
		goCart = UIButton()
		goCart.addTarget(self, action: #selector(btnaction), for: .touchUpInside)
		goCart.tag = 102
   		goCart.setImage(UIImage(named: "icon_bottom_cart"), for: .normal)
		goCart.setTitle("购物车", for: .normal)
		goCart.setTitleColor(Constant.blackColor, for: .normal)
		goCart.titleLabel?.font = .systemFont(ofSize: 13)
		self.addSubview(goCart)
		goCart.snp.makeConstraints { (make) in
			make.top.bottom.equalToSuperview()
			make.width.equalTo(Constant.screenWidth/6)
			make.left.equalTo(collection.snp.right)

		}
		goCart.titleEdgeInsets = UIEdgeInsets(top: (goCart.imageView?.frame.size.height)!+15, left: -((goCart.imageView?.bounds.size.width)!), bottom: 0,right: 0);
		goCart.imageEdgeInsets = UIEdgeInsets(top: 0, left: (goCart.titleLabel?.frame.size.width)!/2, bottom: (goCart.titleLabel?.frame.size.height)!+10, right: -((goCart.titleLabel?.frame.size.width)!)/2);
		
		goodCount = UILabel()
		goodCount.isHidden = true
		goodCount.textColor = UIColor.white
		goodCount.backgroundColor = Constant.redColor
		goodCount.layer.cornerRadius = 9
		goodCount.textAlignment = .center
		goodCount.layer.masksToBounds = true
		goodCount.font = UIFont.systemFont(ofSize: 10)
		goCart.addSubview(goodCount)
		goodCount.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(1)
			make.centerX.equalTo(goCart.snp.centerX).offset(17)
			make.width.height.equalTo(18)
		}

		
		addShopCart = UIButton()
		addShopCart.addTarget(self, action: #selector(btnaction), for: .touchUpInside)
		addShopCart.tag = 103
 		addShopCart.setTitleColor(UIColor.white, for: .normal)
		addShopCart.setTitle("加入购物车", for: .normal)
 		addShopCart.backgroundColor = UIColor.colorFromHex(hex: 0xFFD700)
		self.addSubview(addShopCart)
		addShopCart.snp.makeConstraints { (make) in
			make.top.bottom.equalToSuperview()
			make.left.equalTo(goCart.snp.right)
			make.width.equalTo(Constant.screenWidth/3)
			
		}
		
		let rightBuy:UIButton = UIButton()
		rightBuy.addTarget(self, action: #selector(btnaction), for: .touchUpInside)
		rightBuy.tag = 104
 		rightBuy.setTitleColor(UIColor.white, for: .normal)
		rightBuy.setTitle("立即购买", for: .normal)
 		rightBuy.backgroundColor = Constant.redColor
		self.addSubview(rightBuy)
		rightBuy.snp.makeConstraints { (make) in
			make.top.bottom.equalToSuperview()
			make.left.equalTo(addShopCart.snp.right)
			make.width.equalTo(Constant.screenWidth/3)
			
		}


	}
	
	@objc private func btnaction(sender:UIButton){
		switch sender.tag {
		case 102:
			self.goodCount.isHidden = true
			
			var tempvc:UIViewController? = nil
			let currentVC = self.viewForController(view: self)
 			for  controller in (currentVC?.navigationController?.viewControllers)!{
				if controller.isKind(of: GSCartController.self ){
					tempvc = controller
					self.viewForController(view: self)?.navigationController?.popViewController(animated: true)

				}
			}
 			if tempvc == nil {
				let cartVC:GSCartController = GSCartController()
				cartVC.navigationItem.title = "购物车"
  				self.viewForController(view: self)?.navigationController?.pushViewController(cartVC, animated: true)
				
 			}

			self.viewForController(view: self)?.navigationController?.navigationBar.alpha = 1

		case 103:
			
			let imageview:UIImageView = UIImageView()
			imageview.kf.setImage(with:  URL(string: "https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBi7jHemi8BP_!!0-item_pic.jpg"), placeholder: UIImage(named: "img_01"), options: nil, progressBlock: nil) { (image, error, type, url) in
				
				GSAddShopCartTool.addToShoppingCartWithGoodsImage(goodsImage: image!, startPoint:CGPoint(x: Constant.screenWidth/2, y: Constant.screenHeight - 30) , endPoint: CGPoint(x: Constant.screenWidth/4, y: Constant.screenHeight - 30)) { (finish) in
					
					let scaleAnimation:CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
					scaleAnimation.repeatCount = 2
					scaleAnimation.fromValue = NSNumber(value: 1.0)
					scaleAnimation.toValue = NSNumber(value: 0.75)
					scaleAnimation.autoreverses = true
					scaleAnimation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
					self.goCart.layer.add(scaleAnimation, forKey: nil)
					
					self.number += 1
					self.goodCount.isHidden = false

					if self.number > 0 && self.number < 20
					{
						self.goodCount.text = String(self.number)
					}else{
						self.goodCount.text = "19+"
 					}
					
				}
 			}
  		default:
			break
		}
		print(sender.tag)
	}

}

