//
//  GSCartPricePanelView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/15.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

enum sceneEnum:Int {
	case cart = 1
	case collect
}

class GSCartPricePanelView: UIView {

	var goCartBtn:UIButton!
	var changeSelectState:((Bool) -> Void)?
	var checkbtn:UIButton!
	
	var scene:sceneEnum?{
		didSet{
			switch scene!{
			case .cart:
				goCartBtn.setTitle("￥0.0，去结算", for: .normal)
				checkbtn.addTarget(self, action: #selector(cartaction), for: .touchUpInside)

				break
				
			case .collect:
				goCartBtn.setTitle("删除", for: .normal)
				checkbtn.addTarget(self, action: #selector(cartaction), for: .touchUpInside)
				var rect =  goCartBtn.frame
				rect.origin.x = Constant.screenWidth - 85
				rect.size.width = 70
				goCartBtn.frame = rect
				break
				
			}

		}
	}
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSuvs()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setPrice(totalprice:String){
		goCartBtn.setTitle("￥" + totalprice + "，去结算", for: .normal)

	}
	
	fileprivate func addSuvs(){
		self.backgroundColor = UIColor.white
		
		checkbtn = UIButton()
		checkbtn.setImage( gigaImg("icon_cart_unselected"), for: .normal)
		checkbtn.setImage( gigaImg("icon_cart_selected"), for: .selected)
		checkbtn.setTitle(" 全选", for: .normal)
 		checkbtn.setTitleColor(UIColor.black, for: .normal)
		checkbtn.titleLabel?.font = .systemFont(ofSize: 15)
		addSubview(checkbtn)
		checkbtn.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.height.equalTo(20)
			make.width.equalTo(70)
 			make.left.equalTo(25)
			
		}
		
		goCartBtn = UIButton(frame: CGRect(x: Constant.screenWidth - 165, y: 7, width: 150, height: 36))
 		goCartBtn.setTitleColor(UIColor.white, for: .normal)
		goCartBtn.titleLabel?.font = .systemFont(ofSize: 13)
		setGrandient(view: goCartBtn)
  		goCartBtn.layer.cornerRadius = 18
		goCartBtn.layer.masksToBounds = true
 		addSubview(goCartBtn)
 

	}
	
	fileprivate func setGrandient(view:UIView){
 
		let startColor = UIColor.colorFromHex(hex: 0xea7f3a)
 		let endColor = UIColor.colorFromHex(hex: 0xea3c3c)
 		let gradientColors: [CGColor] = [startColor.cgColor, endColor.cgColor]
 		let gradientLayer: CAGradientLayer = CAGradientLayer()
 		gradientLayer.colors = gradientColors
 		gradientLayer.startPoint = CGPoint(x: 0, y: 0)
 		gradientLayer.endPoint = CGPoint(x: 1, y: 0)
 		gradientLayer.frame = view.bounds
 		view.layer.insertSublayer(gradientLayer, at: 0)
		
	}
	
	func setSenderIsSelectState(isSelected:Bool){
		self.checkbtn.isSelected = isSelected
		
	}


	@objc func cartaction(sender:UIButton){
		
		sender.isSelected = !sender.isSelected
		guard self.changeSelectState != nil else {
			return
		}
		self.changeSelectState!(sender.isSelected)
	}
	
	@objc func collectionaction(sender:UIButton){
		
//		sender.isSelected = !sender.isSelected
//		guard self.changeSelectState != nil else {
//			return
//		}
//		self.changeSelectState!(sender.isSelected)
	}

}
