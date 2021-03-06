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
	let titles:[String] = ["商品".localized(),"评价".localized(),"详情".localized()]
	var collectView:UICollectionView!
	var segment:GSGoodDetailedHeadView!
	var scrolleview:UIScrollView!
	var selectSizeView:GSGoodSelectSizeView!
	var coverView:UIImageView!
	var buyAddShopCartView:GSGoodBuyAddShopCartView!
	var suspendback:UIButton!
	
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
	
	@objc private func suspendbackaction(sender:UIButton){
		
		navigationController?.navigationBar.alpha = 1
		navigationController?.popViewController(animated: true)
        sender.removeFromSuperview()
 	}
	
	private func loadSubViews(){
		
		suspendback = UIButton(type: .custom)
		suspendback.setImage(gigaImg("icon_back"), for: .normal)
		suspendback.layer.cornerRadius = 15
		suspendback.layer.masksToBounds = true
 		suspendback.backgroundColor = .black
		suspendback.alpha = 0
		UIView.animate(withDuration: 1) {
			self.suspendback.alpha = 0.3
 		}
		suspendback.addTarget(self, action: #selector(suspendbackaction), for: .touchUpInside)
		UIApplication.shared.delegate?.window??.addSubview(suspendback)
		suspendback.snp.makeConstraints {
			$0.left.equalTo(15)
			$0.top.equalTo(30)
			$0.width.height.equalTo(30)
		}
		
		titleView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 160, height: 44))
		
		segment = GSGoodDetailedHeadView.init(frame: CGRect(x: 0, y: 0, width: 160, height: 40))
		titleView.addSubview(segment)
		segment.clickIndexMap = {(index:Int) -> Void in
			print(index)
 			DispatchQueue.main.async(execute: {
				self.navigationController?.navigationBar.alpha = 1
 				self.collectView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
				self.buyAddShopCartView.isHidden = (index == 0 ? false : true)
 
			})
 		}
 
		let secondTitle:UILabel = UILabel(frame: CGRect(x: 0, y: 44, width: 160, height: 44))
		secondTitle.textAlignment = .center
		secondTitle.text = "商品详情".localized()
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
		collectView.snp.makeConstraints { 
			$0.left.top.equalToSuperview()
			$0.height.equalTo(Constant.screenHeight)
			$0.width.equalTo(Constant.screenWidth)
		}

	}
	
	
	fileprivate func createPullView(cell:UICollectionViewCell){
		
		bgView = UIView()
		bgView.backgroundColor = Constant.vcBgColor
		cell.contentView.addSubview(bgView)
		bgView.snp.makeConstraints { 
			$0.left.top.right.top.equalToSuperview()
			$0.height.equalTo(2 * Constant.screenHeight + (self.navigationController?.navigationBar.height)!+UIApplication.shared.statusBarFrame.height)
		}
		
		
		tableView = addTableView(.grouped,self)
  		tableView.backgroundColor = Constant.vcBgColor
		tableView.separatorColor = Constant.vcBgColor
		tableView.register(GSGoodInfoTableCell.self, forCellReuseIdentifier: "infoCell")
		bgView.addSubview(tableView)
		tableView.snp.makeConstraints { 
			$0.left.top.right.equalToSuperview()
			$0.height.equalTo(Constant.screenHeight)
		}
		
		
		buyAddShopCartView = GSGoodBuyAddShopCartView()
		self.view.addSubview(buyAddShopCartView)
		buyAddShopCartView.snp.makeConstraints { 
			$0.height.equalTo(60)
			$0.left.bottom.right.equalToSuperview()
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
		tableFootView.setTitle("下拉显示图文详情".localized(), for: .normal)
		tableFootView.setTitleColor(Constant.greyColor, for: .normal)
 		tableView.tableFooterView = tableFootView
 
		webView = WKWebView()
		webView.backgroundColor = UIColor.brown
		bgView.addSubview(webView)
		webView.snp.makeConstraints { 
			$0.top.equalTo(tableView.snp.bottom).offset((self.navigationController?.navigationBar.height)!+UIApplication.shared.statusBarFrame.height)
			$0.left.bottom.right.equalToSuperview()
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
		
		headers.setTitle("下拉查看商品详情".localized(), .Idle)
		headers.setTitle("释放查看商品详情".localized(), .Pulling)
		headers.setTitle("正在进入商品详情".localized(), .Refreshing)
		webView.scrollView.header = headers
		
	}


	@objc fileprivate func pushComment(sender:UIButton){
		self.collectView.scrollToItem(at: IndexPath(item: sender.tag, section: 0), at: .centeredHorizontally, animated: true)
		segment.currentIndex = sender.tag
	}
}

extension GSGoodDetailedMainController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		switch indexPath.row {
		case 0:
			createPullView(cell: cell)

		case 1:
			let comment:GSGoodCommentTableView = GSGoodCommentTableView()
			cell.addSubview(comment)
			comment.mode = .tableheadviewmode
			comment.snp.makeConstraints { 
				$0.edges.equalToSuperview()
 			}

		default:
			break
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
		switch indexPath.section {
		case 0:
			let infocell:GSGoodInfoTableCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! GSGoodInfoTableCell
			
			return infocell
			
		case 1:
			let cell:UITableViewCell = UITableViewCell()
			cell.textLabel?.text = "选择规格".localized()
			
			let selectSize:UIButton = UIButton()
			selectSize.tag = indexPath.section
			selectSize.setTitle("请选择".localized(), for: .normal)
			selectSize.titleLabel?.font = .systemFont(ofSize: 14)
			selectSize.setTitleColor(UIColor.white, for: .normal)
			selectSize.layer.cornerRadius = 15
			selectSize.layer.masksToBounds = true
			selectSize.backgroundColor = Constant.redColor
			selectSize.addTarget(self, action: #selector(selectSizeAction), for: .touchUpInside)
			cell.contentView.addSubview(selectSize)
			selectSize.snp.makeConstraints { 
				$0.centerY.equalToSuperview()
				$0.right.equalToSuperview().offset(-15)
				$0.width.equalTo(80)
				$0.height.equalTo(30)
			}
			return cell
 
		default:
			let cell:UITableViewCell = UITableViewCell()
			cell.selectionStyle = .none
			let lab:UILabel = UILabel()
			lab.text = "商品评价".localized()
			lab.textColor = Constant.blackColor
			cell.contentView.addSubview(lab)
			lab.snp.makeConstraints { 
				$0.top.left.equalToSuperview().offset(15)
			}
			
			let all:UIButton = UIButton()
			all.addTarget(self, action: #selector(pushComment), for: .touchUpInside)
			all.titleLabel?.font = UIFont.systemFont(ofSize: 15)
			all.setTitle("查看全部".localized(), for: .normal)
			all.setTitleColor(Constant.greyColor, for: .normal)
			all.tag = 1
  			cell.contentView.addSubview(all)
			all.snp.makeConstraints { 
 				$0.right.equalTo(-15)
				$0.centerY.equalTo(lab.snp.centerY)
				$0.width.equalTo(70)
				$0.height.equalTo(20)
				
			}

			let comment:GSGoodCommentTableView = GSGoodCommentTableView()
			cell.addSubview(comment)
			comment.snp.makeConstraints { 
				$0.top.equalTo(lab.snp.bottom)
				$0.left.bottom.right.equalToSuperview()
			}
			
			return cell
			


		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 130
		case 1:
			return 50
 		default:
			return Constant.screenHeight/2
		}
 	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		
 	}
 	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 10
	}

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.01
	}
	
	
	
	
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		
		if scrollView == tableView {
 			if scrollView.offsetY > 10{
 				navigationController?.navigationBar.alpha = abs(scrollView.offsetY)/100
				suspendback.alpha = 0


			}else {
				suspendback.alpha = 0.3
 				navigationController?.navigationBar.alpha = 0
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

extension GSGoodDetailedMainController {
 	@objc fileprivate func selectSizeAction(sender:UIButton){
		sender.isSelected = !sender.isSelected
 
			UIView.animate(withDuration: 0.3, animations: {
				self.bgView.layer.backgroundColor = Constant.blackColor.cgColor
				self.tableView.layer.transform = self.firstTransform()
				self.selectSizeView = GSGoodSelectSizeView(frame: CGRect(x: 0, y: Constant.screenHeight, width: Constant.screenHeight, height: Constant.screenWidth))
 				let window:UIWindow = UIApplication.shared.windows.last!
				window.addSubview(self.selectSizeView)
				
				self.selectSizeView.dismissClosure = { ()->Void in
					self.coverViewAction()
				}
				
			}) { (finish) in
				self.coverView = UIImageView(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: Constant.screenHeight - Constant.screenWidth))
				self.coverView.backgroundColor = Constant.blackColor
				let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.coverViewAction))
 				self.coverView.addGestureRecognizer(tap)
				self.coverView.isUserInteractionEnabled = true
				self.coverView.alpha = 0.1
				let window:UIWindow = UIApplication.shared.windows.last!
				window.addSubview(self.selectSizeView)
				
 				window.addSubview(self.coverView)
				UIView.animate(withDuration: 0.3) {
					self.tableView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.95)
					self.selectSizeView.frame = CGRect(x: 0, y: Constant.screenHeight - Constant.screenWidth, width: Constant.screenWidth, height: Constant.screenWidth)
 				}
			}
 
	}
	
	@objc private func coverViewAction(){
		UIView.animate(withDuration: 0.5, animations: {
			self.selectSizeView.frame = CGRect(x: 0, y: Constant.screenHeight, width: Constant.screenWidth, height: Constant.screenWidth)
			self.tableView.layer.transform = self.secondTransform()
			self.coverView.frame = CGRect(x: 0, y: -Constant.screenWidth, width: Constant.screenWidth, height: Constant.screenWidth)

		}) { (finish) in
			self.selectSizeView.removeFromSuperview()
			self.selectSizeView = nil
			self.coverView.removeFromSuperview()
			self.coverView = nil
			UIView.animate(withDuration: 0.5, animations: {
				self.tableView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
			})
		}
	}
	
	func firstTransform() -> CATransform3D {
		var t1:CATransform3D = CATransform3DIdentity
 		t1.m34 = 1.0 / -900
		t1 = CATransform3DScale(t1, 0.95, 0.95, 1)
		t1 = CATransform3DRotate(t1, CGFloat(15.0 * Double.pi / 180.0), 1, 0, 0)
		return t1
	}
	
	func secondTransform() -> CATransform3D {
		var t2:CATransform3D = CATransform3DIdentity
		t2.m34 = 1.0 / -900
		t2 = CATransform3DScale(t2, 1, 1, 1)
		t2 = CATransform3DRotate(t2, CGFloat(15.0 * Double.pi / 180.0), 1, 0, 0)
		return t2
	}
	
}
extension GSGoodDetailedMainController:CycleViewDelegate {
	func cycleViewDidSelectedItemAtIndex(_ index: NSInteger) {
		
	}
		
}
