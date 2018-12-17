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
	lazy var sectionTitles:[[itemlevelModel]] = [[itemlevelModel]]()
 	override func loadView()
	{
		super.loadView()
		self.navigationController?.navigationBar.backgroundColor = UIColor.white
  		self.edgesForExtendedLayout = .bottom
		self.tabBarController?.tabBar.isTranslucent = false
  	}

	override func viewDidLoad() {
        super.viewDidLoad()
		addSubviews()
		loadCategoryData()
		
    }
	
	
	private func loadCategoryData(){
	
		let provider = MoyaTargetType(paramter:["lang_type":"kor","div_code":"2","user_id":"","token":"","cateevent1":"","cateEvent2":""], method: .post, base: .categoryUri, path: .categoryUri)
		provider.requestData(failerror: { (error) in
			print("错误")
		}) { (categorymodel:CategorgyModel) in
			let itemLevelModels:[itemlevelModel] = categorymodel.itemlevel ?? [itemlevelModel]()
			self.maniItemModels = self.manipulationData(manData: itemLevelModels,flag: 0) as? [[[itemlevelModel]]]
			self.indexView.reloadWithManiLevelModel(items: itemLevelModels)
			self.valueView.reloadWithValueModel(item1: (self.maniItemModels?.first)!,item2:self.sectionTitles.first!)
 		}
	}


	private func manipulationData(manData:[itemlevelModel]?,flag:Int) -> [Array<Any>] {
		
 		var itemArray = [itemlevelModel]()
		
		manData?.flatMap({(model) -> [itemlevelModel] in
 			if (flag == 0 ? model.level2 : model.level3) == "*" {
   				itemArray.append(model)
			}
			return itemArray
		})
		(flag == 1 ? sectionTitles.append(itemArray) : nil)

		var itemlAll:[Array<Any>] = [Array<Any>]()
		itemArray.flatMap({(model1) -> [itemlevelModel] in
			
			var itemlevel2Array = [itemlevelModel]()
 			manData?.map({ (model2)  in
				if((flag == 0 ? model2.level1 : model2.level2) == (flag == 0 ? model1.level1 : model1.level2) && (flag == 0 ? model2.level2 : model2.level2) != "*" ){
					
					itemlevel2Array.append(model2)
 				}
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
 		view.addSubview(indexView)
		indexView.snp.makeConstraints { (make) in
			make.bottom.left.top.equalToSuperview()
  			make.width.equalTo(Constant.screenWidth/4)
		}
		
		valueView = GSCateValueColllectView()
		view.addSubview(valueView)
		valueView.snp.makeConstraints { (make) in
			make.right.bottom.equalToSuperview().offset(-10)
  			make.top.equalTo(10)
			make.left.equalTo(indexView.snp.right).offset(10)
 		}
		
	}



}

extension GSCategoryController :GSCateIndexCollectViewDelegate {
	func GSCateIndexCollectViewDidSelectedItemAtIndex(_ index: NSInteger) {
		valueView.reloadWithValueModel(item1: maniItemModels![index],item2:sectionTitles[index])
		print("选中了" + String(index))
	}
	
	
}
