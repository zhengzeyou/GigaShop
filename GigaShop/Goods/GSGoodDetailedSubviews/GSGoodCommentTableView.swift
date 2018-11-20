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
 		tableView.separatorColor = Constant.vcBgColor
 		self.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
 		}

	}
}

extension GSGoodCommentTableView:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:GSGoodCommetTableCell = tableView.dequeueReusableCell(withIdentifier: "reused", for: indexPath) as! GSGoodCommetTableCell
//		cell.returnCellHeight = {(h:CGFloat)->Void in
//			
//		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let str:String = "今天是双十一,很高心来到了东京最出名的地标建筑,拍了一场有生以来最劲爆刺激的二人动作片,期待它和观众朋友们见面。💗"
		let h:CGFloat = UILabel.getTextHeigh(content: str, font: 15, width: Constant.screenWidth - 30)
  		return 100+h+Constant.screenWidth/3 - 10
	}
	
}
