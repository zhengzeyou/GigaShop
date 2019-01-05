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
	var headCollectView:UICollectionView!
	var headTitles:[String] = ["全部".localized() + "(157)","有图".localized() + "(17)","最新".localized()]
	var collectionView:()->UICollectionView = {()->UICollectionView in
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width:(Constant.screenWidth - 30)/4.0-8, height:30.0)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		flowlayout.scrollDirection = .vertical
		
		let collectView:UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.backgroundColor =  Constant.vcBgColor
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
 
		return collectView
	}
	
	enum tableViewHeadMode {
		case defaultmode
		case tableheadviewmode
	}
	var mode:tableViewHeadMode{
		didSet{
			switch mode {
			case .tableheadviewmode:
				addTableHeadView()
			default:
				break
			}
		}
	}
	override init(frame: CGRect) {
		self.mode = .defaultmode
		super.init(frame: frame)
		addSuvs()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addTableHeadView(){
		let headView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: 60))
		headView.backgroundColor = Constant.vcBgColor
		tableView.tableHeaderView = headView
		
		headCollectView = collectionView()
		headCollectView.delegate = self
		headCollectView.dataSource = self
		let defaultSelectCell = IndexPath(row: 0, section: 0)
		headCollectView.selectItem(at: defaultSelectCell, animated: true, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
		headView.addSubview(headCollectView)
		headCollectView.snp.makeConstraints { 
			$0.left.equalTo(15)
			$0.center.equalToSuperview()
			$0.right.equalTo(-15)
			$0.height.equalTo(30)
		}

		
	}
	
	private func addSuvs(){
		tableView = addTableView(.plain,self)
		tableView.register(GSGoodCommetTableCell.self , forCellReuseIdentifier: "reused")
		tableView.register(GSGoodLardCommentTabCell.self , forCellReuseIdentifier: "lard")
  		tableView.separatorColor = .white
 		self.addSubview(tableView)
		tableView.snp.makeConstraints { 
			$0.edges.equalToSuperview()
 		}

	}
}



extension GSGoodCommentTableView:UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.row {
		case 0:
			let cell:GSGoodCommetTableCell = tableView.dequeueReusableCell(withIdentifier: "reused", for: indexPath) as! GSGoodCommetTableCell
			return cell

		default:
			let cell:GSGoodLardCommentTabCell = tableView.dequeueReusableCell(withIdentifier: "lard", for: indexPath) as! GSGoodLardCommentTabCell

			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let str:String = "今天是双十一,很高心来到了东京最出名的地标建筑,拍了一场有生以来最劲爆刺激的二人动作片,期待它和观众朋友们见面。💗"
		let h:CGFloat = UILabel.getTextHeigh(content: str, font: 15, width: Constant.screenWidth - 30)
		switch indexPath.row {
		case 0:
			return 100+h+Constant.screenWidth/3 - 10
		default:
			return 140
		}
		
	}
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 1
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 0.01
	}
	
}

extension GSGoodCommentTableView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		
		let unselectview:UIView = UIView()
		unselectview.layer.cornerRadius = 15
		unselectview.layer.masksToBounds = true
		unselectview.backgroundColor =  UIColor.white
		cell.backgroundView = unselectview
		
		let selectview:UIView = UIView()
		selectview.layer.cornerRadius = 15
		selectview.layer.masksToBounds = true
		selectview.backgroundColor =  Constant.redColor
		cell.selectedBackgroundView = selectview
		
		let title:UILabel = UILabel()
		title.textAlignment = .center
		title.text = headTitles[indexPath.row]
		title.textColor = Constant.greyColor
		title.tag = indexPath.row + 1
		title.font = .systemFont(ofSize: 14)
		cell.addSubview(title)
		title.snp.makeConstraints { 
			$0.edges.equalToSuperview()
		}
		
		if indexPath.row == 0 {
			title.textColor = UIColor.white
			
		}else{
			title.textColor = Constant.greyColor
			
		}
		
		
		
		return cell
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(indexPath.row)
		for i in 0..<self.headTitles.count {
			let index:IndexPath = IndexPath(item: i, section: 0)
			let cell:UICollectionViewCell = collectionView.cellForItem(at: index)!
			let title:UILabel = cell.viewWithTag(i + 1) as! UILabel
			title.textColor = Constant.greyColor
			
		}
		let cell:UICollectionViewCell = collectionView.cellForItem(at: indexPath)!
		let title:UILabel = cell.viewWithTag(indexPath.row + 1) as! UILabel
		title.textColor = UIColor.white
	}
	
}
