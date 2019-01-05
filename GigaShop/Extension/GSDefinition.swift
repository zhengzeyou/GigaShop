//
//  GSDefinition.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/19.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit
import Kingfisher

var defaultImage:UIImage {
	let image =  UIImage(named: "icon_category_clothing")?.withRenderingMode(.alwaysOriginal)
	return image!
}

var gigaImg:(String) -> UIImage = { (icon:String) -> UIImage in
	
	let image =  UIImage(named:icon)?.withRenderingMode(.alwaysOriginal)
	return image ?? defaultImage
}

var gigaLabel:(String?,CGFloat?,UIColor?,NSTextAlignment?) -> UILabel = {(content:String?,fontValue:CGFloat?,textColor:UIColor?,textAlignment:NSTextAlignment?) -> UILabel in
	let label:UILabel = UILabel()
	label.text = content
 	label.font = UIFont.systemFont(ofSize: fontValue ?? 17)
	label.textColor = textColor ?? Constant.blackColor
	label.textAlignment = textAlignment ?? .left
  	label.numberOfLines = 0
	return label
	
}
var gigaButton:( _ :String, _ :UIColor, _ :UIColor) -> UIButton = { (title:String,textColor:UIColor, backColor:UIColor) in
	let btn:UIButton = UIButton(frame: .zero)
 	btn.backgroundColor = backColor
	btn.setTitle(title.localized(), for: .normal)
	btn.setTitleColor(textColor, for: .normal)
	return btn

}

var gigaImageView:(String?,String?) -> UIImageView = {(imagenamed:String?,cachekey:String?) -> UIImageView in
	
	let imageview:UIImageView = UIImageView(frame: .zero)
	imageview.contentMode = .scaleAspectFit

	let isUrl:Bool = imagenamed?.hasPrefix("http") ?? false
	if isUrl {
		var imageCache = UIImageView.getCacheImage(cachekey)
		if imageCache != nil {
			imageview.image = imageCache
		}else {
			imageview.kf.setImage(with:URL(string: imagenamed!), placeholder: nil, options: [.cacheOriginalImage], progressBlock: { (receive, total) in
				
			}, completionHandler: { (image, error, cachetype, url) in
				UIImageView.saveCacheImage(image!,cachekey)
			})

		}

  	} else {
		imageview.image = UIImage(named: imagenamed ?? "icon_category_clothing")?.withRenderingMode(.alwaysOriginal)
	}
	return imageview
	
	}



var addTableView:(UITableView.Style,AnyObject) -> UITableView = { (style:UITableView.Style,viewController:AnyObject) -> UITableView in

	let tableview = UITableView(frame: .zero, style: style)
	tableview.delegate = viewController as? UITableViewDelegate
	tableview.dataSource = viewController as? UITableViewDataSource
	tableview.estimatedRowHeight = 0
	tableview.estimatedSectionFooterHeight = 0
	tableview.estimatedSectionHeaderHeight = 0
	tableview.tableFooterView = UIView()
	tableview.separatorColor =  Constant.vcBgColor
 	tableview.contentInsetAdjustmentBehavior = .never
	tableview.tableFooterView = UIView()
	tableview.backgroundColor = Constant.vcBgColor

 	return tableview
}
