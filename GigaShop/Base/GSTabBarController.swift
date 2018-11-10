//
//  CMTabBarController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/7.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSTabBarController: UITabBarController {

	enum Tab:Int {
		case home
		case cate
		case cart
  		case mypage
		
		init(offset:Int){
			self.init(rawValue:offset)!
			
		}
		
		var image:UIImage?{
			switch self {
			case .home:
				return UIImage(named: "icon_bottom_homepage_n")?.withRenderingMode(.alwaysOriginal)
			case .cate:
				return UIImage(named: "icon_bottom_category_n")?.withRenderingMode(.alwaysOriginal)
 			case .cart:
				return UIImage(named: "icon_bottom_cart_n")?.withRenderingMode(.alwaysOriginal)
			case .mypage:
				return UIImage(named: "icon_bottom_mine_n")?.withRenderingMode(.alwaysOriginal)

 			}
		}
		
		var selectimage:UIImage?{
			switch self {
			case .home:
				return UIImage(named: "icon_bottom_homepage_s")?.withRenderingMode(.alwaysOriginal)
			case .cate:
				return UIImage(named: "icon_bottom_category_s")?.withRenderingMode(.alwaysOriginal)
			case .cart:
				return UIImage(named: "icon_bottom_cart_s")?.withRenderingMode(.alwaysOriginal)
 			case .mypage:
				return UIImage(named: "icon_bottom_mine_s")?.withRenderingMode(.alwaysOriginal)
				
			}
		}

		
		var title:String{
			switch self {
			case .home:
 				return "首页".localized()
			case .cate:
				return "分类".localized()
			case .cart:
				return "购物车".localized()
  			case .mypage:
				return "我的".localized()

			}
		}
		
	}
    override func viewDidLoad() {
        super.viewDidLoad()

		delegate = self as UITabBarControllerDelegate;
		
		let home = GSHomeController()
		home.title = Tab.home.title
		let homeNavi = UINavigationController(rootViewController: home)
		
		let cate = GSCategoryController()
		cate.title = Tab.cate.title
		let cateNavi = UINavigationController(rootViewController: cate)

		let cart = GSCartController()
		cart.title = Tab.cart.title
		let cartNavi = UINavigationController(rootViewController: cart)

 		let mypage = GSMineController()
		mypage.title = Tab.mypage.title
  		let mypageNavi = UINavigationController(rootViewController: mypage)

		
		
		viewControllers = [homeNavi,cateNavi,cartNavi,mypageNavi]
		tabBar.barTintColor = UIColor.white
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Constant.redColor], for: .selected)
 
		viewControllers?.enumerated().forEach({ (offset, controller) in
			let tab = Tab(offset: offset)
			controller.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectimage)
		})
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

extension GSTabBarController: UITabBarControllerDelegate {
	
	func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		return true
 	}

}
