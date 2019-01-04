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
import Siren

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
 	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//		let tabBar:GSTabBarController = GSTabBarController()
//		window?.rootViewController = tabBar
//		window?.makeKeyAndVisible()
		
		GSAccount.sharedCMAccount().changeloginOutStatus(tokenStr: nil)
		setSiren()
 		AppDelegate.configRealm()
		return true
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
		Siren.shared.checkVersion(checkType: .daily)
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		Siren.shared.checkVersion(checkType: .daily)
	}
	
	private func setSiren(){
		
		let siren = Siren.shared
		siren.alertType = .option
		siren.delegate = self
		siren.debugEnabled = true
		siren.majorUpdateAlertType = .option
		siren.minorUpdateAlertType = .option
		siren.patchUpdateAlertType = .option
		siren.revisionUpdateAlertType = .option
  		siren.alertMessaging = SirenAlertMessaging(updateTitle: "New Fancy Title", updateMessage: "New message goes here!", updateButtonMessage: "Update Now, Plz!?", nextTimeButtonMessage: "OK, next time it is!", skipVersionButtonMessage: "Please don't push skip, please don't!")
		siren.showAlertAfterCurrentVersionHasBeenReleasedForDays = 0
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

extension AppDelegate: SirenDelegate
{
	func sirenDidShowUpdateDialog(alertType: Siren.AlertType) {
		print(#function, alertType)
	}
	
	func sirenUserDidCancel() {
		print(#function)
	}
	
	func sirenUserDidSkipVersion() {
		print(#function)
	}
	
	func sirenUserDidLaunchAppStore() {
		print(#function)
	}
	
	func sirenDidFailVersionCheck(error: Error) {
		print(#function, error)
	}
	
	func sirenLatestVersionInstalled() {
		print(#function, "Latest version of app is installed")
	}
	
	func sirenNetworkCallDidReturnWithNewVersionInformation(lookupModel: SirenLookupModel) {
		print(#function, "\(lookupModel)")
	}
	
	// This delegate method is only hit when alertType is initialized to .none
	func sirenDidDetectNewVersionWithoutAlert(title: String, message: String, updateType: UpdateType) {
		print(#function, "\n\(title)\n\(message).\nRelease type: \(updateType.rawValue.capitalized)")
	}
}



