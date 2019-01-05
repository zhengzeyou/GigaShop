//
//  GSCartController.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

var tableview:UITableView!
var showPircePanel:GSCartPricePanelView!
var allPrices:CGFloat?
var defaultSelect:Bool = false
let data:[[NSDictionary]] = [[["goodname":"ADDIAS冬季最新款鞋","goodurl":"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1542007443&di=e0c7b5cd274f8624149d5c1fa59d32af&src=http://m.360buyimg.com/mobilecms/s750x750_jfs/t9382/255/419174577/214784/f9026ac4/59aa5039N3b06738b.jpg!q80.jpg","goodNum":3,"goodprice":"1899.01"],["goodname":"COACH豆蔻迟女包经典波士顿包奢侈品","goodurl":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542097015350&di=e5176001fb939f1ccf908f4289aefd7e&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D1f6841e845c2d562e605d8ae8f78fa9a%2F8435e5dde71190efd0967d57c41b9d16fcfa60cd.jpg","goodNum":1,"goodprice":"1599.01"]],[["goodname":"ADDIAS冬季最新款鞋","goodurl":"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1542007443&di=e0c7b5cd274f8624149d5c1fa59d32af&src=http://m.360buyimg.com/mobilecms/s750x750_jfs/t9382/255/419174577/214784/f9026ac4/59aa5039N3b06738b.jpg!q80.jpg","goodNum":2,"goodprice":"1299.01"],["goodname":"COACH豆蔻迟女包经典波士顿包奢侈品","goodurl":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542097015350&di=e5176001fb939f1ccf908f4289aefd7e&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D1f6841e845c2d562e605d8ae8f78fa9a%2F8435e5dde71190efd0967d57c41b9d16fcfa60cd.jpg","goodNum":1,"goodprice":"899.01"]]]

var goodNunbers:NSMutableArray = [[0,0],[0,0]]

class GSCartController: BaseController {
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.navigationBar.backgroundColor = UIColor.white
		self.tabBarController?.tabBar.isTranslucent = false
		self.edgesForExtendedLayout = .bottom
  //		emptyCart()
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
 
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor =  Constant.vcBgColor
 		allPrices = 7596.04
		nonEmptyCart()
    }
	
	fileprivate func specialMulti(goodDatas:[[NSDictionary]],goodnum:[[Int]]) {
		var totalPrice:CGFloat = 0.0
		for i in 0 ..< goodDatas.count {//section
 			for j in 0 ..< goodDatas[i].count {//row
				
				let dic:NSDictionary = goodDatas[i][j]
				let curPrice:NSString = dic.object(forKey: "goodprice") as! NSString
				let curPricef:CGFloat = CGFloat(curPrice.floatValue)
 				let goodSectionNumber:NSArray = goodNunbers[i] as! NSArray
				let curNum:Int = goodSectionNumber[j] as! Int
				
				totalPrice += curPricef * CGFloat(curNum)

			}
		}
		print(totalPrice)
		showPircePanel.setPrice(totalprice: String(format: "%.2f", totalPrice))
		
	}
	fileprivate func checkIsAllSelected() -> Bool{
		for i in 0 ..< data.count {//section
			for j in 0 ..< data[i].count {//row
				let sections:NSArray = goodNunbers[i] as! NSArray
				let element:Int = sections[j] as! Int
				if element == 0 {
					return false
				}
			}
		}
		return true
		
	}
	
}

extension GSCartController:UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:GSCartGoodTabCell = tableView.dequeueReusableCell(withIdentifier: "reused", for: indexPath) as! GSCartGoodTabCell
		cell.setGoodData(dic:data[indexPath.section][indexPath.row] )
		cell.setSenderIsSelectState(isSelected: defaultSelect)
		cell.changeCount = { (number:Int) -> Void in
			print(indexPath.section,indexPath.row,number)
 
			let sectionData:[Int] = goodNunbers[indexPath.section] as! [Int]
			let temp:NSMutableArray = NSMutableArray(array: sectionData)
			temp.replaceObject(at: indexPath.row, with: number)
			goodNunbers.replaceObject(at: indexPath.section, with: temp)
			self.specialMulti(goodDatas: data, goodnum: goodNunbers as! [[Int]])
 			showPircePanel.setSenderIsSelectState(isSelected: self.checkIsAllSelected())
			print(goodNunbers)

		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let goodDetailVC:GSGoodDetailedMainController = GSGoodDetailedMainController()
		goodDetailVC.hidesBottomBarWhenPushed = true
		self.navigationController?.pushViewController(goodDetailVC, animated: true)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 120
 	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		
		return 10
 	}
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.01
	}
	
	
	
	fileprivate func nonEmptyCart(){
		tableview = addTableView(.plain,self)
  		tableview.register(GSCartGoodTabCell.self, forCellReuseIdentifier: "reused")
  		view.addSubview(tableview)
		tableview.snp.makeConstraints { 
			$0.left.right.top.equalToSuperview()
			$0.bottom.equalTo(-50)
		}
		tableview.contentInsetAdjustmentBehavior = .never

		showPircePanel = GSCartPricePanelView()
		showPircePanel.scene = .cart
		showPircePanel.changeSelectState = {(state:Bool) -> Void in
			defaultSelect = state
			tableview.reloadData()
		}
		view.addSubview(showPircePanel)
		showPircePanel.snp.makeConstraints { 
			$0.left.right.equalToSuperview()
			$0.top.equalTo(tableview.snp.bottom)
			$0.height.equalTo(50)
		}
	}
	
	
	
	
	fileprivate func emptyCart(){
		let emptytitle:UILabel = UILabel()
		emptytitle.text = "购物车什么都没有~".localized()
		emptytitle.textColor = Constant.greyColor
		view.addSubview(emptytitle)
		emptytitle.snp.makeConstraints { 
			$0.center.equalToSuperview()
		}
		
		let emptyIcon:UIImageView = UIImageView(image:  gigaImg( "img_empty_cart"))
		view.addSubview(emptyIcon)
		emptyIcon.snp.makeConstraints { 
			$0.bottom.equalTo(emptytitle.snp.top).offset(-10)
			$0.width.height.equalTo(emptytitle.snp.width)
			$0.centerX.equalToSuperview()
		}
		
		let emptybtn:UIButton = UIButton()
		emptybtn.layer.cornerRadius = 20
		emptybtn.layer.masksToBounds = true
		emptybtn.setTitle("去逛逛".localized(), for: .normal)
		emptybtn.setTitleColor(UIColor.white, for: .normal)
		emptybtn.backgroundColor = Constant.redColor
		emptybtn.addTarget(self, action: #selector(goShop), for: .touchUpInside)
		view.addSubview(emptybtn)
		emptybtn.snp.makeConstraints { 
			$0.top.equalTo(emptytitle.snp.bottom).offset(20)
			$0.left.equalTo(emptytitle.snp.left).offset(10)
			$0.right.equalTo(emptytitle.snp.right).offset(-10)
			$0.height.equalTo(40)
			
		}
	}
	
	
	@objc func goShop(sender:UIButton){
		print("go shop")
	}
	

}
