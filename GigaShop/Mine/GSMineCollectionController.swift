//
//  GSMineCollectionController.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/19.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit
import JRefresh
class GSMineCollectionController: UIViewController {
	var listTableView:UITableView!
	var editmanager:Bool = false
	var defaultSelect:Bool = false

	var choicePanel:GSCartPricePanelView!
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		edgesForExtendedLayout = .bottom
 		navigationController?.navigationBar.barTintColor = UIColor.white
		navigationController?.navigationBar.tintColor = Constant.blackColor
		navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
		
		let rightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
 		rightBtn.setTitle("管理", for: .normal)
		rightBtn.setTitle("取消", for: .selected)
		rightBtn.titleLabel?.font = .systemFont(ofSize: 14)
		rightBtn.setTitleColor(Constant.blackColor, for: .normal)
		rightBtn.addTarget(self, action: #selector(manager), for:.touchUpInside )
		let rightItem = UIBarButtonItem(customView: rightBtn)
		navigationItem.rightBarButtonItem = rightItem


	}
	
	@objc func manager(item:UIButton){
		item.isSelected = !item.isSelected
 		editmanager = item.isSelected
 		listTableView.reloadData()
		choicePanel.isHidden = !editmanager

	}
    override func viewDidLoad() {
        super.viewDidLoad()
  		addSubViews()
		
	}
	private func addSubViews(){
		
		view.backgroundColor = Constant.vcBgColor
		
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
		listTableView.register(GSMineCollectionTableCell.self, forCellReuseIdentifier: "infoCell")
		view.addSubview(listTableView)
		listTableView.snp.makeConstraints {
			$0.edges.equalToSuperview()
 		}
		
		listTableView.header = JRefreshStateHeader.headerWithRefreshingBlock({[weak self] in
			guard self != nil else {return}
			DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
				self?.listTableView.header?.endRefreshing()
 			})
		})
		listTableView.header?.beginRefreshing()
 		listTableView.footer = JRefreshAutoStateFooter.footerWithRefreshingBlock({
			
		})

		
		choicePanel = GSCartPricePanelView()
		choicePanel.scene = .collect
		choicePanel.isHidden = true
		choicePanel.changeSelectState = {(state:Bool) -> Void in
			self.defaultSelect = state
  			self.listTableView.reloadData()
		}
		view.addSubview(choicePanel)
		choicePanel.snp.makeConstraints {
			$0.left.right.equalToSuperview()
			$0.bottom.equalToSuperview()
			$0.height.equalTo(50)
		}

	}
	
}
extension GSMineCollectionController :UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:GSMineCollectionTableCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! GSMineCollectionTableCell
		cell.isEdited = editmanager
		cell.setSenderIsSelectState(isSelected: defaultSelect)

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
