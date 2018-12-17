//
//  GSGoodSelectSizeView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSGoodSelectSizeView: UIView {
	var logo:UIImageView!
	var price:UILabel!
	var storeCount:UILabel!
	var sumbit:UIButton!
	var dismissClosure:(()->Void)?
	var sizeTableView:UITableView!
	let count:GSCartCountView = GSCartCountView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.white
		self.layer.cornerRadius = 10
		self.layer.masksToBounds = true
		addSubViews()
		addTableView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		logo = UIImageView()
		logo.kf.setImage(with: URL(string: "https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBi7jHemi8BP_!!0-item_pic.jpg"))
		logo.layer.borderColor = Constant.vcBgColor.cgColor
		logo.layer.borderWidth = 1
		self.addSubview(logo)
		logo.snp.makeConstraints { (make) in
			make.left.top.equalTo(20)
			make.width.height.equalTo(Constant.screenWidth/4)
		}
		
		storeCount = UILabel()
		storeCount.text = "库存2445件"
		storeCount.textColor = Constant.greyColor
		storeCount.font = .systemFont(ofSize: 15)
		self.addSubview(storeCount)
		storeCount.snp.makeConstraints { (make) in
			make.left.equalTo(logo.snp.right).offset(10)
			make.bottom.equalTo(logo.snp.bottom)
			
		}
		
		price = UILabel()
		price.text = "￥1259.00"
		price.textColor = Constant.redColor
		price.font = .systemFont(ofSize: 20)
		self.addSubview(price)
		price.snp.makeConstraints { (make) in
			make.left.equalTo(logo.snp.right).offset(10)
			make.bottom.equalTo(storeCount.snp.top).offset(-5)
			
		}
		
		let del:UIButton = UIButton()
		del.setImage( gigaImg( "icon_close_00"), for: .normal)
		del.addTarget(self, action: #selector(delAction), for: .touchUpInside)
		self.addSubview(del)
		del.snp.makeConstraints { (make) in
			make.top.equalTo(10)
			make.right.equalTo(-10)
			make.width.height.equalTo(40)
		}
		
		
		self.sumbit = UIButton()
		self.sumbit.layer.cornerRadius = 25
		self.sumbit.layer.masksToBounds = true
		self.sumbit.backgroundColor = Constant.redColor
 		self.sumbit.setTitle("确认", for: .normal)
		self.sumbit.addTarget(self, action: #selector(delAction), for: .touchUpInside)
		self.sumbit.setTitleColor(UIColor.white	, for: .normal)
		self.addSubview(self.sumbit)
		self.sumbit.snp.makeConstraints { (make) in
			make.height.equalTo(50)
			make.left.equalTo(30)
			make.right.equalTo(-30)
			make.bottom.equalTo(-20)
		}
		
	}
	
	@objc private func delAction(sender:UIButton){
		guard self.dismissClosure != nil else {
			return
		}
		self.dismissClosure!()
		
	}
}


extension GSGoodSelectSizeView:UITableViewDelegate,UITableViewDataSource{
	
	fileprivate func addTableView(){
		sizeTableView = UITableView(frame: .zero, style: .plain)
		sizeTableView.delegate = self
		sizeTableView.dataSource = self
		sizeTableView.estimatedRowHeight = 0
		sizeTableView.estimatedSectionFooterHeight = 0
		sizeTableView.estimatedSectionHeaderHeight = 0
		sizeTableView.tableFooterView = UIView()
		sizeTableView.register(GSGoodSelectParamaSizeTabCell.self, forCellReuseIdentifier: "paramID")
		sizeTableView.separatorStyle = .none
		self.addSubview(sizeTableView)
		sizeTableView.snp.makeConstraints { (make) in
			make.left.right.equalToSuperview()
			make.top.equalTo(logo.snp.bottom).offset(5)
			make.bottom.equalTo(sumbit.snp.top).offset(-5)

		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.row {
		case 0:
			return 220
		default:
			return 80

		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = UITableViewCell()
		
		if indexPath.row == 0 {
			let cell:GSGoodSelectParamaSizeTabCell = tableView.dequeueReusableCell(withIdentifier: "paramID", for: indexPath) as! GSGoodSelectParamaSizeTabCell
			

			
			let line:UILabel = UILabel()
			line.backgroundColor = Constant.vcBgColor
			cell.contentView.addSubview(line)
			line.snp.makeConstraints { (make) in
				make.bottom.equalToSuperview()
				make.height.equalTo(1)
				make.left.equalTo(10)
				make.right.equalTo(-10)
			}
			
			return cell

		}else {
			
			cell.textLabel?.text = "购买数量"
 
			count.mode = .showGray
			count.setNumberText(nums: 1)
			count.changeNumber = {(num:Int) -> Void in
			
			}
			cell.contentView.addSubview(count)
			count.snp.makeConstraints { (make) in
				make.right.equalTo(-15)
				make.width.equalTo(150)
				make.height.equalTo(40)
				make.top.equalTo(15)
			}

		
		}


		return cell
	}
	
	
}
