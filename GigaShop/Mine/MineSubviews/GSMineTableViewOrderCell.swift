//
//  GSMineOrderTableCell.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/18.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit

class GSMineTableViewOrderCell: UITableViewCell {
	var orderTableView:UITableView!
	var goPay:UIButton!
	var cancelOrder:UIButton!
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		createSuv()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func createSuv(){
		selectionStyle = .none
 		contentView.backgroundColor = Constant.vcBgColor
		orderTableView = UITableView(frame: .zero, style: .plain)
		orderTableView.delegate = self
		orderTableView.dataSource = self
		orderTableView.layer.cornerRadius = 8
		orderTableView.layer.masksToBounds = true
		orderTableView.isScrollEnabled = false
 		orderTableView.register(GSMineSingleTableCell.self, forCellReuseIdentifier: "GSMineSingleTableCell")
 
		contentView.addSubview(orderTableView)
		orderTableView.snp.makeConstraints {
			$0.left.equalTo(15)
			$0.top.equalTo(30)
			$0.bottom.equalToSuperview()
			$0.right.equalTo(-15)

		}

	}

}


extension GSMineTableViewOrderCell:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0||indexPath.row == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "GSMineSingleTableCell", for: indexPath)
 			return cell
			
		}else if(indexPath.row == 2) {
			
			let cell = UITableViewCell()
			let contents:String = "共2件商品，合计:￥4567.00(含运费￥20.00)"
  			let contentlabel = UILabel()
			contentlabel.attributedText = NSMutableAttributedString.highLightText(contents,
																				  highLight: "￥4567.00",
																				  normalfontValue: 13,
																				  normalcolor:nil,
																				  hightfontValue: 15,
																				  hightLightColor:nil)
			
 			cell.contentView.addSubview(contentlabel)
			contentlabel.snp.makeConstraints {
				$0.left.equalToSuperview().offset(15)
				$0.centerY.equalToSuperview()
			}
			return cell
 
		}else{
			let cell = UITableViewCell()
 			let waitlabel:UILabel = gigaLabel("等待买家付款",15,Constant.redColor,nil)
			cell.contentView.addSubview(waitlabel)
			waitlabel.snp.makeConstraints {
				$0.left.equalTo(15)
				$0.centerY.equalToSuperview()
			}
			
			goPay = UIButton()
			goPay.titleLabel?.font = .systemFont(ofSize: 15)
  			goPay.setTitle("去付款", for: .normal)
			goPay.setTitleColor(UIColor.black, for: .normal)
			goPay.layer.cornerRadius = 15
			goPay.layer.masksToBounds = true
			goPay.layer.borderColor = Constant.vcBgColor.cgColor
			goPay.layer.borderWidth = 1
  			goPay.addTarget(self, action: #selector(goPayAction), for: .touchUpInside)
			cell.contentView.addSubview(goPay)
			goPay.snp.makeConstraints {
				$0.centerY.equalToSuperview()
				$0.height.equalTo(30)
				$0.width.equalTo(80)
				$0.right.equalTo(-15)
				
			}
			
			cancelOrder = UIButton()
			cancelOrder.titleLabel?.font = .systemFont(ofSize: 15)
			cancelOrder.setTitle("取消订单", for: .normal)
			cancelOrder.setTitleColor(UIColor.black, for: .normal)
			cancelOrder.layer.cornerRadius = 15
			cancelOrder.layer.masksToBounds = true
			cancelOrder.layer.borderColor = Constant.vcBgColor.cgColor
			cancelOrder.layer.borderWidth = 1
			cancelOrder.addTarget(self, action: #selector(goPayAction), for: .touchUpInside)
			cell.contentView.addSubview(cancelOrder)
			cancelOrder.snp.makeConstraints {
				$0.centerY.equalToSuperview()
				$0.height.equalTo(30)
				$0.width.equalTo(80)
				$0.right.equalTo(goPay.snp.left).offset(-15)
				
			}
			return cell

		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0||indexPath.row == 1 {
			return 100
 		}
		return 50

 	}
	
	@objc private func goPayAction(sender:UIButton){
		
	}
}
