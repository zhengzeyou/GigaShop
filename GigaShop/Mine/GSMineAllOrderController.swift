//
//  GSMineAllOrderController.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/18.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit

class GSMineAllOrderController: BaseController {
	var orderTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
 		addTableView()
     }
	override func loadView() {
		super.loadView()
		
		navigationController?.navigationBar.tintColor = Constant.blackColor
		navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
 
	}

	private func addTableView(){
 		orderTableView = UITableView(frame: .zero, style: .plain)
		orderTableView.delegate = self
		orderTableView.dataSource = self
		orderTableView.separatorColor = UIColor.clear
		orderTableView.register(GSMineTableViewOrderCell.self, forCellReuseIdentifier: "GSMineOrderTableCell")
		view.addSubview(orderTableView)
		orderTableView.snp.makeConstraints {
 			$0.edges.equalToSuperview()
		}
	}

 }

extension GSMineAllOrderController:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "GSMineOrderTableCell", for: indexPath)
		return cell
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 330
	}

}
