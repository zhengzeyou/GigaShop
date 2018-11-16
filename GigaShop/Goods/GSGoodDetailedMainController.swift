//
//  GSGoodDetailedMainController.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/15.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import WebKit
import JRefresh


class GSGoodDetailedMainController: UIViewController {
	var tableView:UITableView!
	var webView:WKWebView!
	var bgView:UIView!
	var titleView:UIScrollView!
	let titles:[String] = ["商品","评价","详情"]
	var collectView:UICollectionView!
//	var bannerView:CycleView!

	var scrolleview:UIScrollView!
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.view.layer.backgroundColor = Constant.vcBgColor.cgColor
		self.navigationController?.navigationBar.tintColor = Constant.blackColor
		self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
		self.navigationController?.navigationBar.alpha = 0
 	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		loadSubViews()
		createMiddleCollectView()
     }
	
	private func createMiddleCollectView(){
		
		
	}
	
	private func loadSubViews(){
		
		titleView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 160, height: 44))
		
 		let segment:GSGoodDetailedHeadView = GSGoodDetailedHeadView.init(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
		titleView.addSubview(segment)
		segment.clickIndexMap = {(index:Int) -> Void in
			print(index)
			self.collectView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
 		}
 
		let secondTitle:UILabel = UILabel(frame: CGRect(x: 0, y: 44, width: 160, height: 44))
		secondTitle.textAlignment = .center
		secondTitle.text = "商品详情"
		titleView.addSubview(secondTitle)
 
		self.navigationItem.titleView = titleView

		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth , height: Constant.screenHeight)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		flowlayout.scrollDirection = .horizontal

		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView.tag = 1001
		collectView.isScrollEnabled = false
		collectView.contentInsetAdjustmentBehavior = .never
		collectView.layer.backgroundColor = UIColor.clear.cgColor
		collectView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView.dataSource = self
		collectView.delegate = self
   		view.addSubview(collectView)
		collectView.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview()
			make.height.equalTo(Constant.screenHeight)
			make.width.equalTo(Constant.screenWidth)
		}

	}
	
	
	fileprivate func createPullView(cell:UICollectionViewCell){
		
		bgView = UIView()
		bgView.backgroundColor = Constant.vcBgColor
		cell.contentView.addSubview(bgView)
		bgView.snp.makeConstraints { (make) in
			make.left.top.right.top.equalToSuperview()
			make.height.equalTo(2 * Constant.screenHeight + (self.navigationController?.navigationBar.height)!+UIApplication.shared.statusBarFrame.height)
		}
		
		
		tableView = UITableView(frame: .zero, style: .grouped)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.estimatedSectionFooterHeight = 0
		tableview.estimatedSectionHeaderHeight = 0
		tableView.contentInsetAdjustmentBehavior = .never
		tableView.backgroundColor = Constant.vcBgColor
		tableView.separatorColor = Constant.vcBgColor
		
		bgView.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.left.top.right.equalToSuperview()
			make.height.equalTo(Constant.screenHeight)
		}
		
		//轮播图加载
		let tableHeadView:CycleView = CycleView(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: Constant.screenWidth))
		tableHeadView.delegate = self
		tableHeadView.pgmode = .numberCount
		tableHeadView.mode = .scaleAspectFit
		tableHeadView.currentPageColor = Constant.redColor
		tableHeadView.pageColor = Constant.greyColor
 		tableHeadView.imageURLStringArr = ["https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBi7jHemi8BP_!!0-item_pic.jpg", "https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhBhTF7Fo4uif_!!4120736425.jpg","https://img.alicdn.com/imgextra/i1/4120736425/O1CN011xKhB4WccycS4Ym_!!4120736425.jpg","https://img.alicdn.com/imgextra/i4/4120736425/O1CN011xKhC56zXUOU7gz_!!4120736425.jpg","https://img.alicdn.com/imgextra/i2/4120736425/O1CN011xKhB4MQGSoRofE_!!4120736425.jpg"]

 		tableView.tableHeaderView = tableHeadView
		
		let tableFootView:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: 30))
		tableFootView.setTitle("下拉显示详情", for: .normal)
		tableFootView.setTitleColor(Constant.greyColor, for: .normal)
 		tableView.tableFooterView = tableFootView
 
		webView = WKWebView()
		webView.backgroundColor = UIColor.brown
		bgView.addSubview(webView)
		webView.snp.makeConstraints { (make) in
			make.top.equalTo(tableView.snp.bottom).offset((self.navigationController?.navigationBar.height)!+UIApplication.shared.statusBarFrame.height)
			make.left.bottom.right.equalToSuperview()
 		}
		let headers:JRefreshNormalHeader = JRefreshNormalHeader.headerWithRefreshingBlock {
			self.webView.scrollView.header?.endRefreshing()
			UIView.animate(withDuration: 0.8, animations: {
				var frame:CGRect = self.bgView.frame
				frame.origin.y = 0
				self.bgView.frame = frame
				self.titleView.contentOffset = CGPoint(x: 0, y: 0)
			})
			} as! JRefreshNormalHeader
		
		headers.setTitle("下拉查看商品详情", .Idle)
		headers.setTitle("释放查看商品详情", .Pulling)
		headers.setTitle("正在进入商品详情", .Refreshing)
		webView.scrollView.header = headers
		
	}


}

extension GSGoodDetailedMainController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		if indexPath.row == 0 {
			createPullView(cell: cell)
		}else {
			let title:UILabel = UILabel()
			title.tag = indexPath.row + 1
			title.textColor = Constant.redColor
			title.text = titles[indexPath.row]
			cell.contentView.addSubview(title)
			title.snp.makeConstraints { (make) in
				make.center.equalToSuperview()
			}

		}
		return cell
	}
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	}
	
}


extension GSGoodDetailedMainController:UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate,UIScrollViewDelegate{
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = UITableViewCell()
  		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 120
		case 1:
			return 50
 		default:
			return Constant.screenHeight/2
		}
 	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 6
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.1
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		
		if scrollView == tableView {
 			if scrollView.offsetY > 10{
			
				let bomValue:CGFloat = (self.navigationController?.navigationBar.height)! + UIApplication.shared.statusBarFrame.height
				self.navigationController?.navigationBar.alpha = abs(scrollView.offsetY)/bomValue
				
			}else {
				
				self.navigationController?.navigationBar.alpha = 0
 			}
			
			if (tableView.contentOffset.y - tableView.contentSize.height + Constant.screenHeight > 100 && scrollView.isDragging == false) {
				webView.load(NSURLRequest(url: URL(string: "http://www.baidu.com")!) as URLRequest)

				UIView.animate(withDuration: 0.8) {
					var frame:CGRect = self.bgView.frame
					frame.origin.y = -Constant.screenHeight
					self.bgView.frame = frame
					self.titleView.contentOffset = CGPoint(x: 0, y: 44)
				}

			}
			
		}
	}
	
	
	
}
extension GSGoodDetailedMainController:CycleViewDelegate {
	func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
		
	}
		
}
