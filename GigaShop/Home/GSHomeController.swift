//
//  GSHomeController.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import SnapKit

var maintableview:UITableView!
var topView:GSHomeTopView!

enum Part:Int {
	case top
	case category
	case mono
	case showimages
	case mustbuy
	init(offset:Int){
		self.init(rawValue: offset)!
	}
	var title:String? {
		switch self {
		case .mono:
			return "人气单品"
		case .mustbuy:
			return "必买清单"
		default:
			return ""
 		}
	}
	
	var singleView:UIView?{
		switch self {
		case .top:
			return GSHomeTopView(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height:3*Constant.screenWidth/5.0 ))
		case .category:
			return nil
		case .mono:
			return nil
		case .showimages:
			return nil
		case .mustbuy:
			return nil
		}
	}

}


class GSHomeController: BaseController {
	private var scrollView:UIScrollView!
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
		navigationController?.navigationBar.shadowImage = nil
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		addTableView()

    }
	



}

extension GSHomeController:UITableViewDelegate,UITableViewDataSource {
	 func addTableView(){
		guard maintableview == nil else {
			return
		}
 		maintableview = UITableView(frame: .zero, style: .grouped)
		maintableview.delegate = self
		maintableview.dataSource = self
		maintableview.tableFooterView = UIView()
		maintableview.estimatedSectionFooterHeight = 0
		maintableview.estimatedSectionHeaderHeight = 0
		maintableview.register(GSHomeCateGridTabCell.self, forCellReuseIdentifier: "section0")
		maintableview.register(GSHomeMonoTabCell.self, forCellReuseIdentifier: "section1")
		maintableview.register(GSHomeImagesTabCell.self, forCellReuseIdentifier: "section2")
		maintableview.register(GSHomeMustTabCell.self, forCellReuseIdentifier: "section3")

		topView = Part.top.singleView as? GSHomeTopView
		maintableview.tableHeaderView = topView
		view.addSubview(maintableview)

		maintableview.snp.makeConstraints { (make) in
			make.left.right.equalToSuperview()
			make.bottom.equalToSuperview()
 			make.top.equalTo(-((self.navigationController?.navigationBar.height)! + UIApplication.shared.statusBarFrame.size.height))
		}
 
		
		
	}
	func numberOfSections(in tableView: UITableView) -> Int {
		return 4
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
 	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let part:Part = Part.init(rawValue: indexPath.section+1)!
		switch part {
		case .category:
			let cell:GSHomeCateGridTabCell = tableView.dequeueReusableCell(withIdentifier: "section0", for: indexPath) as! GSHomeCateGridTabCell
			return cell
		case .mono:
			let cell:GSHomeMonoTabCell = tableView.dequeueReusableCell(withIdentifier: "section1", for: indexPath) as! GSHomeMonoTabCell
			return cell
		case .showimages:
			let cell:GSHomeImagesTabCell = tableView.dequeueReusableCell(withIdentifier: "section2", for: indexPath) as! GSHomeImagesTabCell
			return cell
		default:
			let cell:GSHomeMustTabCell = tableView.dequeueReusableCell(withIdentifier: "section3", for: indexPath) as! GSHomeMustTabCell
			return cell
		}

 	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let part:Part = Part.init(rawValue: indexPath.section+1)!
 		switch part {
		case .category:
			return 2*(Constant.screenWidth-10)/5 + 40
		case .mono:
			return Constant.screenWidth / 3.0 + 140
		case .showimages:
			return 17*Constant.screenWidth/20 + 10
		default:
			return 3*(Constant.screenWidth / 2 + 100) + 30
 		}

 
	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		switch section {
		case 0:
			return 0.01
		default:
			return 10
		}
	}
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.01
	}
	
	
}
