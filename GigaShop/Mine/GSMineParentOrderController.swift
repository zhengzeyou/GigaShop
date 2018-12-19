//
//  GSMineAllOrderController.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/18.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit

class GSMineParentOrderController: TYTabPagerController {
	enum pageType: Int {
		case all
		case paywait
		case sendwait
		case receivewait
		case commentwait

		static let count: Int = 5
		
		var title: String {
			switch self {
			
			case .all:
				return "全部"
			case .paywait:
				return "带付款"
			case .sendwait:
				return "待发货"
			case .receivewait:
				return "待收货"
			case .commentwait:
				return "待评价"

			}
		}
		
		init(index: Int) {
			self.init(rawValue: index)!
		}
	}
	lazy var datas = [String]()

	override func loadView() {
		super.loadView()
	
		navigationController?.navigationBar.tintColor = Constant.blackColor
		navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
		edgesForExtendedLayout = .bottom

	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
 
	}

    override func viewDidLoad() {
        super.viewDidLoad()
	
  		dataSource = self
		delegate = self
  		tabBar.layout.barStyle = TYPagerBarStyle.progressElasticView
 		tabBar.layout.cellWidth = Constant.screenWidth/CGFloat(pageType.count)
  		tabBar.layout.normalTextFont = .systemFont(ofSize: 15)
		tabBar.layout.cellSpacing = 0
		tabBar.layout.progressWidth = Constant.screenWidth/CGFloat(pageType.count + 1)
		tabBarHeight = 60
		reloadData()
		
     }
	
}

extension GSMineParentOrderController: TYTabPagerControllerDataSource, TYTabPagerControllerDelegate{
	func numberOfControllersInTabPagerController() -> Int {
		return pageType.count
	}
	
	func tabPagerController(_ tabPagerController: TYTabPagerController, controllerFor index: Int, prefetching: Bool) -> UIViewController {
		let vc = GSMineAllOrderController()
		vc.view.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
		return vc
	}
	
	func tabPagerController(_ tabPagerController: TYTabPagerController, titleFor index: Int) -> String {
		return pageType.init(index: index).title
	}

	
	
	
	
	
	
	
	
}
