//
//  GSDefinition.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/19.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit

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

var gigaImageView:(String?,CGFloat?,CGFloat?,UIColor?) -> UIImageView = {(imagenamed:String?,cornerRadius:CGFloat?,borderWidth:CGFloat?,borColor:UIColor?) -> UIImageView in
	
	let imageview:UIImageView = UIImageView(frame: .zero)
 	imageview.layer.cornerRadius = cornerRadius ?? 0
	imageview.layer.masksToBounds = true
	imageview.layer.borderColor = borColor?.cgColor ?? UIColor.clear.cgColor
	imageview.layer.borderWidth = borderWidth ?? 0
	imageview.contentMode = .scaleAspectFit

	let isUrl:Bool = imagenamed?.hasPrefix("http") ?? false
	if isUrl {
		
 		imageview.kf.setImage(with: URL(string: imagenamed ?? "icon_category_clothing"), placeholder: defaultImage, options: nil, progressBlock: nil, completionHandler: nil)
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

 	return tableview
}
