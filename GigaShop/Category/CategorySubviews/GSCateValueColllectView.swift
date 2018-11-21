//
//  GSCateValueColllectView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/12.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCateValueColllectView: UIView {
	var tableview:UITableView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)

 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		addSubviews()

 	}

	private func addSubviews(){
		tableview = UITableView(frame: .zero, style: .plain)
		tableview.delegate = self
		tableview.dataSource = self
		tableview.estimatedRowHeight = 0
		tableview.estimatedSectionFooterHeight = 0
		tableview.estimatedSectionHeaderHeight = 0
		tableview.register(GSCateValueTabCell.self, forCellReuseIdentifier: "tablecell")
		tableview.tableFooterView = UIView()
		tableview.showsVerticalScrollIndicator = false
		tableview.separatorColor =  Constant.vcBgColor
		self.addSubview(tableview)
		tableview.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}

}
extension GSCateValueColllectView:UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:GSCateValueTabCell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! GSCateValueTabCell
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 3*Constant.screenWidth/4 - 20
	}
	

	
	
	
}
