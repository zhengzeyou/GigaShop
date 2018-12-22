//
//  GSCategoryController.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class GSCategoryController: BaseController {
	var indexView:GSCateIndexCollectView!
	var valueView:GSCateValueColllectView!
	var maniItemModels:[[[itemlevelModel]]]?
	var levelCounts:[itemlevelModel]?
	var defaultRealmData:[itemlevelModel] = [itemlevelModel]()
	lazy var sectionTitles:[[itemlevelModel]] = [[itemlevelModel]]()
 	override func loadView()
	{
		super.loadView()
		navigationController?.navigationBar.backgroundColor = UIColor.white
  		edgesForExtendedLayout = .bottom
		tabBarController?.tabBar.isTranslucent = false
  	}

	override func viewDidLoad() {
        super.viewDidLoad()
		addSubviews()
		loadCategoryData()
		
    }
	
	private func loadCategoryData(){
		
		defaultRealmData = cateRealmModelRealmTool.getItemlevelModel()
		if defaultRealmData.count != 0 {
			self.indexView.isHidden = false
			self.valueView.isHidden = false
			self.maniItemModels = self.manipulationData(manData: defaultRealmData,flag: 0) as? [[[itemlevelModel]]]
  			self.indexView.reloadWithManiLevelModel(items: defaultRealmData)
			self.valueView.reloadWithValueModel(item1: (self.maniItemModels?.first)!,item2:self.sectionTitles.first!)
		}
		else {
			
			let show = GSTips(view: view, mode: .loading)
			let provider = MoyaTargetType(paramter:["lang_type":"kor","div_code":"2","user_id":"","token":"","cateevent1":"","cateEvent2":""], method: .post, base: .categoryUri, path: .categoryUri)
			provider.requestData(failerror: { (error) in
				let _ = GSTips(view: self.view, mode: .error)
				
			}) { (categorymodel:CategorgyModel) in
				
				show.hide(animated: true)
				self.indexView.isHidden = false
				self.valueView.isHidden = false
				let itemLevelModels:[itemlevelModel] = categorymodel.itemlevel ?? [itemlevelModel]()
				if self.defaultRealmData.count < itemLevelModels.count {
					self.saveRealmItemLevelModel(itemmodels: itemLevelModels)
				}
				self.maniItemModels = self.manipulationData(manData: itemLevelModels,flag: 0) as? [[[itemlevelModel]]]
				self.indexView.reloadWithManiLevelModel(items: itemLevelModels)
				self.valueView.reloadWithValueModel(item1: (self.maniItemModels?.first)!,item2:self.sectionTitles.first!)
				
			}

			
		}
	}

	private func saveRealmItemLevelModel(itemmodels:[itemlevelModel]){
		var tempRealms = [cateRealmModel]()
		for i in 0..<itemmodels.count{
			
			let item = itemmodels[i]
			let model = cateRealmModel()
			model.ID = String(i)
			model.level1 = item.level1 ?? ""
			model.level2 = item.level2 ?? ""
			model.level3 = item.level3 ?? ""
			model.level_name = item.level_name ?? ""
			model.image_url = item.image_url ?? ""
			model.rank = item.rank ?? ""
			tempRealms.append(model)
			cateRealmModelRealmTool.insertItemlevelModel(by: model)
 		}
 
	}

	private func manipulationData(manData:[itemlevelModel]?,flag:Int) -> [Array<Any>] {
		
 		var itemArray = [itemlevelModel]()
		
		let _ = manData?.flatMap({(model) -> [itemlevelModel] in
 			if (flag == 0 ? model.level2 : model.level3) == "*" {
   				itemArray.append(model)
			}
			return itemArray
		})
		(flag == 1 ? sectionTitles.append(itemArray) : nil)

		var itemlAll:[Array<Any>] = [Array<Any>]()
		let _ = itemArray.flatMap({(model1) -> [itemlevelModel] in
			
			var itemlevel2Array = [itemlevelModel]()
 			let _ = manData?.map({ (model2)  in
				if((flag == 0 ? model2.level1 : model2.level2) == (flag == 0 ? model1.level1 : model1.level2) && (flag == 0 ? model2.level2 : model2.level3) != "*" ){
					
					itemlevel2Array.append(model2)
 				}
//				(flag == 0 ? nil : self.saveRealmItemLevelModel(items: itemlevel2Array) )
 			})
			
			if flag == 0 {
				let itemSecArray = manipulationData(manData: itemlevel2Array,flag:1)
				itemlAll.append(itemSecArray)

			}else{
				itemlAll.append(itemlevel2Array)
 			}

			return itemArray
		})
 
		return itemlAll

	}
	
	private func addSubviews(){

		self.view.backgroundColor =  Constant.vcBgColor
		
		indexView = GSCateIndexCollectView()
		indexView.delegate = self
		indexView.isHidden = true
 		view.addSubview(indexView)
		indexView.snp.makeConstraints { 
			$0.bottom.left.top.equalToSuperview()
  			$0.width.equalTo(Constant.screenWidth/4)
		}
		
		valueView = GSCateValueColllectView()
		valueView.isHidden = true
		view.addSubview(valueView)
		valueView.snp.makeConstraints { 
			$0.right.bottom.equalToSuperview().offset(-10)
  			$0.top.equalTo(10)
			$0.left.equalTo(indexView.snp.right).offset(10)
 		}
		
	}



}

extension GSCategoryController :GSCateIndexCollectViewDelegate {
	
	func GSCateIndexCollectViewDidSelectedItemAtIndex(_ index: NSInteger) {
		valueView.reloadWithValueModel(item1: maniItemModels![index],item2:sectionTitles[index])
		print("选中了" + String(index))
	}
	
	
}
