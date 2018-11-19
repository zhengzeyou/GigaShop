//
//  GSGoodCommentTableView.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/19.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodCommentTableView: UIView {
	var tableView:UITableView!
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSuvs()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSuvs(){
		tableView = UITableView(frame: .zero, style: .plain)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.estimatedRowHeight = 0
		tableView.estimatedSectionFooterHeight = 0
		tableView.estimatedSectionHeaderHeight = 0
		tableView.contentInsetAdjustmentBehavior = .never
		tableView.register(GSGoodCommetTableCell.self , forCellReuseIdentifier: "reused")
		tableView.backgroundColor = Constant.vcBgColor
		tableView.separatorColor = Constant.vcBgColor
 		self.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
 		}

	}
}

extension GSGoodCommentTableView:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:GSGoodCommetTableCell = tableView.dequeueReusableCell(withIdentifier: "reused", for: indexPath) as! GSGoodCommetTableCell
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
}
