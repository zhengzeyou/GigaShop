//
//  GSMineController.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSMineController: BaseController {
	var tableView:UITableView!
	var mineTopView:GSMineTopView!
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
 		navigationController?.navigationBar.alpha = 0
		

	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
		navigationController?.navigationBar.shadowImage = nil
		navigationController?.navigationBar.alpha = 1

	}

    override func viewDidLoad() {
        super.viewDidLoad()
		addTableView()
    }
}

extension GSMineController:UITableViewDelegate,UITableViewDataSource {
	func addTableView(){
		guard tableView == nil else {
			return
		}
		tableView = UITableView(frame: .zero, style: .grouped)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
		tableView.estimatedSectionFooterHeight = 0
		tableView.estimatedSectionHeaderHeight = 0
		tableView.register(GSMineOrderStateTabCell.self, forCellReuseIdentifier: "section0")
		tableView.register(GSMineServeTabCell.self, forCellReuseIdentifier: "section1")
		tableView.contentInsetAdjustmentBehavior = .never

 		mineTopView = GSMineTopView(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height:Constant.screenWidth/2.0 ))
		tableView.tableHeaderView = mineTopView
		view.addSubview(tableView)
		
		tableView.snp.makeConstraints { 
			$0.edges.equalToSuperview()
 		}
		
		
		
	}
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cell:GSMineOrderStateTabCell = tableView.dequeueReusableCell(withIdentifier: "section0", for: indexPath) as! GSMineOrderStateTabCell
			return cell
		default:
			let cell:GSMineServeTabCell = tableView.dequeueReusableCell(withIdentifier: "section1", for: indexPath) as! GSMineServeTabCell
			return cell

		}

 	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return Constant.screenWidth / 5.0 + 50.0
 		default:
			return 2.0*Constant.screenWidth / 3.0 

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
