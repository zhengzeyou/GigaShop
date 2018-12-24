//
//  commentStarView.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/18.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit

class GSStarView: UIView {
	var starValue:CGFloat = 0.0
	var disValue:CGFloat = 0.0

	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	@objc public func setStarValue(value:CGFloat,h:CGFloat){
		starValue = value
		createSuv(h:h)
	}
	
	private func createSuv(h:CGFloat){
 
		let defaultStarBG:UIView = UIView()
		addSubview(defaultStarBG)
		defaultStarBG.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		
		let IntS:CGFloat = CGFloat(floor(starValue))
		let floatS:CGFloat = starValue - IntS
		let yellowStarBG:UIView = UIView()
		yellowStarBG.clipsToBounds = true
		addSubview(yellowStarBG)
		yellowStarBG.snp.makeConstraints {
			$0.left.height.bottom.equalToSuperview()
			$0.width.equalTo(floatS * h + IntS * CGFloat(h + disValue))
		}
		
		for i in 0...4 {
			
   			let yellowstar:UIImageView = UIImageView(image:gigaImg("icon_bottom_collection_fill"))
			yellowstar.contentMode = .scaleAspectFit
			yellowStarBG.addSubview(yellowstar)
			yellowstar.snp.makeConstraints {
				$0.top.equalToSuperview()
				$0.left.equalTo(i*Int(h + disValue))
				$0.width.height.equalTo(h)
			}
			
 			let defaultstar:UIImageView = UIImageView(image:gigaImg("icon_bottom_collection"))
			defaultstar.contentMode = .scaleAspectFit
			defaultStarBG.addSubview(defaultstar)
			defaultstar.snp.makeConstraints {
				$0.top.equalToSuperview()
				$0.left.equalTo(i*Int(h + disValue))
				$0.width.height.equalTo(h)
			}
 

 		}
		
		
	}

}
