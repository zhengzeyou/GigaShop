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
	var valueItems:[[itemlevelModel]] = [[itemlevelModel]]()
	var titlesItems:[itemlevelModel] = [itemlevelModel]()
	var rowHeight:CGFloat = 3*Constant.screenWidth/8 - 30.0
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()

 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
 	}
	
	func reloadWithValueModel(item1:[[itemlevelModel]],item2:[itemlevelModel]){
		valueItems = item1
		titlesItems = item2
		tableview.reloadData()
		tableview.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
		

 	}

	private func addSubviews(){
		tableview = addTableView(.plain,self)
 		tableview.register(GSCateValueTabCell.self, forCellReuseIdentifier: "tablecell")
		tableview.showsVerticalScrollIndicator = false
		addSubview(tableview)
		tableview.snp.makeConstraints { 
			$0.edges.equalToSuperview()
		}
	}

}


extension GSCateValueColllectView:UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return valueItems.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let indexItems = valueItems[indexPath.row]
		let cell:GSCateValueTabCell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! GSCateValueTabCell
		cell.reloadWithCateValueItemsModel(item1:indexItems,item2:titlesItems[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let indexItems = valueItems[indexPath.row]
		let sections = ceil(CGFloat(indexItems.count)/3.0)
		return sections*rowHeight + 40.0
 	}

}
