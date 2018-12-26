//
//  MoyaRequest.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/10/31.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
 
enum MoyaBaseUriEnum:String{
	
	case mainUri
	case categoryUri

	var baseUri:URL{
		switch self {
		case .mainUri:
			return URL(string: "http://mall.gigawon.co.kr:8800/api/")!
		case .categoryUri:
			return URL(string: "http://mall.gigawon.co.kr:8800/api/")!

		}
	}
}

enum MoyaPathEnum:String{
	
	case mainUri
	case categoryUri

	var pathUri:String{
		switch self {
		case .mainUri:
			return "StoreCate/requestStoreCate1FavList"
		case .categoryUri:
			return "Main/requestGetMain"

		}
	}
}
