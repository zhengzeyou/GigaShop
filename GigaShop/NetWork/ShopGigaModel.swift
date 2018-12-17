//
//  ShopGigaModel.swift
//  GigaShop
//
//  Created by ozawa on 2018/12/15.
//  Copyright © 2018 GIGA Korea. All rights reserved.
//

import UIKit
import HandyJSON
//--------------商品分类界面的数据实体-------------------
struct LeftBottomCateModel:HandyJSON{
	var level1:String?
	var level2:String?
	var level_name:String?
 }
struct itemlevelModel:HandyJSON{
	var level1:String?
	var level2:String?
	var level3:String?
	var level_name:String?
	var image_url:String?
	var rank:String?

}

struct eventtypeModel:HandyJSON{
	var ad_title:String?
	var sub_title:String?
	var ad_image:String?
	var link_url:String?
	var custom_code:String?
	var item_code:String?
	var item_name:String?
	var item_p:String?
	var market_p:String?
	var item_img_url:String?
 }
struct bannerlistModel:HandyJSON{
	var ad_title:String?
	var ad_image:String?
	var link_url:String?
	var custom_code:String?
	var item_code:String?
	
}


struct CategorgyModel:HandyJSON{
	
	var bannerlist10:[bannerlistModel]?
	var bannerlist15:[bannerlistModel]?
	var bannerlist18:[bannerlistModel]?
	var eventtype20:[eventtypeModel]?
	var eventtype21:[eventtypeModel]?
	var eventtype22:[eventtypeModel]?
	var itemlevel:[itemlevelModel]?
	var LeftBottomCate21:[itemlevelModel]?
	var LeftBottomCate22:[itemlevelModel]?

	var status:String?
	var flag:String?
	var msg:String?
	var start_page:String?
	var end_page:String?
	var pg:String?
	var tot_page:String?
	var tot_cnt:String?
	
	init() {}
}

