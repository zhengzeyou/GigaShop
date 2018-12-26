//
//  AppDelegate.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
 	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let tabBar:GSTabBarController = GSTabBarController()
		window?.rootViewController = tabBar
		window?.backgroundColor = .white
		window?.makeKeyAndVisible()
		AppDelegate.configRealm()
 
		return true
	}
	
	
	
 	public class func configRealm() {
		
		let dbVersion : UInt64 = 1
		let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
		let dbPath = docPath.appending("/defaultDB.realm")
		let config = Realm.Configuration(fileURL:URL(string: dbPath), inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: dbVersion, migrationBlock: { (migration, oldSchemaVersion) in
			
		}, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: nil)
		Realm.Configuration.defaultConfiguration = config
		Realm.asyncOpen { (realm, error) in
			if let _ = realm {
				print("Realm 服务器配置成功!")
			}else if let error = error {
				print("Realm 数据库配置失败：\(error.localizedDescription)")
			}
		}
	}

}

