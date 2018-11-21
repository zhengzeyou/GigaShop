//
//  GSCategoryListController.swift
//  GigaShop
//
//  Created by ozawa on 2018/11/20.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCategoryListController: UIViewController,PYSearchViewControllerDelegate {
	var placher:UITextField!
	var search:UIButton!
	var condition:GSCateListConditionView!
	var listTableView:UITableView!
	var listCollectView:UICollectionView!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.navigationBar.barTintColor = UIColor.white
		self.navigationController?.navigationBar.tintColor = Constant.blackColor
		self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
		let navbottomline:UIImageView = findHairlineImageViewUnder(vw: (self.navigationController?.navigationBar)!)
 		self.search.isHidden = false
 		self.edgesForExtendedLayout = .bottom
		navbottomline.isHidden = true
		
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		search.isHidden = true
		let navbottomline:UIImageView = findHairlineImageViewUnder(vw: (self.navigationController?.navigationBar)!)
		navbottomline.isHidden = false

	}
	override func viewDidLoad() {
		super.viewDidLoad()
		setNaviBar()
		addSubViews()

	}
	private func addSubViews(){
		
		self.view.backgroundColor = Constant.vcBgColor
		condition = GSCateListConditionView()
		self.view.addSubview(condition)
		condition.snp.makeConstraints { (make) in
			make.left.top.right.equalToSuperview()
			make.height.equalTo(60)
		}
		
		listTableView = UITableView(frame: .zero, style: .plain)
		listTableView.delegate = self
		listTableView.dataSource = self
		listTableView.estimatedRowHeight = 0
		listTableView.estimatedSectionFooterHeight = 0
		listTableView.estimatedSectionHeaderHeight = 0
		listTableView.contentInsetAdjustmentBehavior = .never
 		listTableView.separatorColor = UIColor.colorFromHex(hex: 0xe6e6e6)
		listTableView.layer.borderColor = Constant.vcBgColor.cgColor
		listTableView.layer.borderWidth = 1
		listTableView.register(GSCategoryListTableCell.self, forCellReuseIdentifier: "infoCell")
		self.view.addSubview(listTableView)
		listTableView.snp.makeConstraints { (make) in
			make.left.bottom.right.equalToSuperview()
			make.top.equalTo(condition.snp.bottom)
		}
		
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width:(Constant.screenWidth - 10) / 2 ,height: Constant.screenWidth / 2 + 100)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		flowlayout.scrollDirection = .vertical
		
		listCollectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		listCollectView.backgroundColor =  UIColor.white
		listCollectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		listCollectView.dataSource = self
		listCollectView.delegate = self
		listCollectView.layer.borderColor = Constant.vcBgColor.cgColor
		listCollectView.layer.borderWidth = 1
 		listCollectView.showsHorizontalScrollIndicator = false
		listCollectView.isHidden = true
		self.view.addSubview(listCollectView)
		listCollectView.snp.makeConstraints({ (make) in
			make.left.bottom.right.equalToSuperview()
			make.top.equalTo(condition.snp.bottom)
		})
		
 	}

	
	
	private func setNaviBar(){
		
		let rightBtn:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
		rightBtn.tag = 101
		rightBtn.setImage(UIImage(named: "icon_list"), for: .normal)
		rightBtn.setImage(UIImage(named: "icon_pic"), for: .selected)
		rightBtn.addTarget(self, action: #selector(btnAcion), for: .touchUpInside)
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

		search = UIButton(frame: CGRect(x: 55, y: 5, width: Constant.screenWidth - 110, height: 36))
		search.addTarget(self, action: #selector(btnAcion), for: .touchUpInside)
 		search.tag = 1003
		search.layer.cornerRadius = 18
		search.layer.masksToBounds = true
		search.backgroundColor = Constant.vcBgColor
		self.navigationController?.navigationBar.addSubview(search)

 
		let searchIcon:UIImageView = UIImageView(image: UIImage(named: "icon_search_around")?.withRenderingMode(.alwaysOriginal))
		search.addSubview(searchIcon)
		searchIcon.snp.makeConstraints { (make) in
			make.left.equalTo(12)
			make.centerY.equalToSuperview()
			make.width.height.equalTo(18)
		}
		
		let del:UIButton = UIButton()
		del.tag = 102
		del.setImage(UIImage(named: "icon_delete_search"), for: .normal)
		del.addTarget(self, action: #selector(btnAcion), for: .touchUpInside)
		search.addSubview(del)
		del.snp.makeConstraints { (make) in
			make.right.equalTo(-10)
			make.centerY.equalToSuperview()
			make.width.height.equalTo(24)
		}
		
		placher = UITextField()
		placher.isUserInteractionEnabled = false
		placher.placeholder = "输入关键字"
 		placher.textColor = Constant.blackColor
		search.addSubview(placher)
		placher.snp.makeConstraints { (make) in
			make.left.equalTo(searchIcon.snp.right).offset(10)
			make.right.equalTo(del.snp.left).offset(-10)
			make.centerY.equalToSuperview()
		}

	}
	@objc func btnAcion(sender:UIButton){
		switch sender.tag {
		case 101:
			sender.isSelected = !sender.isSelected
			if sender.isSelected {
				listTableView.isHidden = true
				listCollectView.isHidden = false
			}else{
				listTableView.isHidden = false
				listCollectView.isHidden = true

			}
			
		case 102:
			placher.text = ""

 		default:
			do{
				
				let hotSearches:NSArray = NSArray()
				let searchVC:PYSearchViewController = PYSearchViewController(hotSearches: hotSearches as? [String], searchBarPlaceholder: "搜索关键字".localized()) { (searchViewController, searchBar, searchText) in
					self.placher.text = searchText
					self.navigationController?.popViewController(animated: true)

				}
				searchVC.searchHistoryStyle = .normalTag
				searchVC.delegate = self
				self.navigationController?.pushViewController(searchVC, animated: true)
				

			}
		}
 	}


	@objc func modeAction(sender:UIButton){
		sender.isSelected = !sender.isSelected
	}
	
	func didClickCancel(_ searchViewController: PYSearchViewController!) {
		self.navigationController?.popViewController(animated: true)

	}
	
 	private func findHairlineImageViewUnder(vw:UIView)->UIImageView!{
		if(vw.isKind(of: UIImageView.self) && vw.bounds.size.height <= 1.0 ){
			
			return vw as? UIImageView
			
		}
		for subview in vw.subviews {
			let imageView = self.findHairlineImageViewUnder(vw: subview)
			if (imageView != nil) {
				return imageView
				
			}
			
		}
		return nil
		
	}
 }

extension GSCategoryListController :UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:GSCategoryListTableCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! GSCategoryListTableCell
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 140
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let goodDetailVC:GSGoodDetailedMainController = GSGoodDetailedMainController()
		goodDetailVC.hidesBottomBarWhenPushed = true
		self.navigationController?.pushViewController(goodDetailVC, animated: true)
 
	}
	
 }

extension GSCategoryListController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		for view in cell.contentView.subviews {
			view.removeFromSuperview()
		}
		let logo:UIImageView = UIImageView()
		cell.contentView.addSubview(logo)
		logo.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview()
			make.right.equalTo(-2)
			make.height.equalTo(Constant.screenWidth / 2)
		}
		logo.kf.setImage(with: URL(string: "https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBhTF7Fo4uif_!!4120736425.jpg"))
		
		let title:UILabel = UILabel()
		title.font = UIFont.systemFont(ofSize: 15)
		title.textColor = Constant.blackColor
		title.text = "碧蒙萱 bioemsan非离子迷迭洁面乳150ml化妆水100ml保湿霜70ml套装"
		title.numberOfLines = 2
		cell.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.equalTo(logo.snp.left)
			make.top.equalTo(logo.snp.bottom).offset(5)
			make.right.equalTo(logo.snp.right)
			make.height.equalTo(40)
		}
		
		let price:UILabel = UILabel()
		price.textColor = Constant.redColor
		price.text = "￥1800.00"
		price.font = UIFont.systemFont(ofSize: 15)
		cell.contentView.addSubview(price)
		price.snp.makeConstraints { (make) in
			make.left.equalTo(logo.snp.left)
			make.top.equalTo(title.snp.bottom).offset(10)
			make.right.equalTo(logo.snp.right)
			make.height.equalTo(15)
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let goodDetailVC:GSGoodDetailedMainController = GSGoodDetailedMainController()
		goodDetailVC.hidesBottomBarWhenPushed = true
		self.navigationController?.pushViewController(goodDetailVC, animated: true)
		
	}
	
}
