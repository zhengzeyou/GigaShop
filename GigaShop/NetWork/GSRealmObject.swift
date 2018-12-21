//
//  GSRealmObject.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/20.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class cateRealmModel: Object {
	@objc dynamic var ID:String = ""
   	@objc dynamic var level1:String = ""
	@objc dynamic var level2:String = ""
	@objc dynamic var level3:String = ""
	@objc dynamic var level_name:String = ""
	@objc dynamic var image_url:String = ""
	@objc dynamic var rank:String = ""

	override static func primaryKey() -> String{
		return "ID"
	}

	override static func ignoredProperties() -> [String] {
		return ["rank"]
	}

	override static func indexedProperties() -> [String]{
		return ["level_name"]
	}
}


class cateRealmModelRealmTool: Object {
	private class func getDB() -> Realm {
 
		let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
		let dbPath = docPath.appending("/defaultDB.realm")
		let defaultRealm = try! Realm(fileURL: URL.init(string:dbPath)!)
		UserDefaults(suiteName: "DB")?.set(dbPath, forKey: "defaultDBKey")
 		print(defaultRealm.configuration.fileURL ?? "")
 		return defaultRealm
	}
}
 extension cateRealmModelRealmTool {
	
	public class func insertItemlevelModel(by catemodel : cateRealmModel) -> Void {
		let defaultRealm = self.getDB()
		try! defaultRealm.write {
			defaultRealm.add(catemodel, update: true)
 		}
		
	}
	public class func getItemlevelModel() -> [itemlevelModel]{
		let defaultRealm = getDB()
		let array = defaultRealm.objects(cateRealmModel.self)
		var temps:[itemlevelModel] = [itemlevelModel]()
		for caterealmModel in array {
			var item = itemlevelModel()
			item.level1 = caterealmModel.level1
			item.level2 = caterealmModel.level2
			item.level3 = caterealmModel.level3
			item.image_url = caterealmModel.image_url
			item.level_name = caterealmModel.level_name
			item.rank = caterealmModel.rank
			temps.append(item)
		}
		print(temps)

		return temps
 
	}
}

