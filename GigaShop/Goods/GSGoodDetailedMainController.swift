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
     }
	
	
	private func loadSubViews(){
		
		titleView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 160, height: 44))
		
		let segment:GSGoodDetailedHeadView = GSGoodDetailedHeadView(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
 		titleView.addSubview(segment)
 
		let secondTitle:UILabel = UILabel(frame: CGRect(x: 0, y: 44, width: 160, height: 44))
		secondTitle.textAlignment = .center
		secondTitle.text = "商品详情"
 		titleView.addSubview(secondTitle)
 
		self.navigationItem.titleView = titleView
		
		bgView = UIView()
		bgView.backgroundColor = Constant.vcBgColor
  		view.addSubview(bgView)
		bgView.snp.makeConstraints { (make) in
			make.left.top.right.top.equalToSuperview()
			make.height.equalTo(2 * Constant.screenHeight)
		}
		
		tableView = UITableView(frame: .zero, style: .plain)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.contentInsetAdjustmentBehavior = .never

		bgView.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.left.top.right.equalToSuperview()
  			make.height.equalTo(Constant.screenHeight)
		}
		
		let tableHeadView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: Constant.screenWidth))
		tableHeadView.backgroundColor = UIColor.brown
		tableView.tableHeaderView = tableHeadView

		webView = WKWebView()
		webView.backgroundColor = UIColor.brown
 		webView.load(NSURLRequest(url: URL(string: "http://www.baidu.com")!) as URLRequest)
		bgView.addSubview(webView)
		webView.snp.makeConstraints { (make) in
			make.top.equalTo(tableView.snp.bottom).offset(((self.navigationController?.navigationBar.height)! + UIApplication.shared.statusBarFrame.size.height))
			make.left.right.bottom.equalToSuperview()
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


extension GSGoodDetailedMainController:UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate,UIScrollViewDelegate{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = UITableViewCell()
		cell.textLabel?.text = String(format: "%d", indexPath.row)
 		return cell
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
