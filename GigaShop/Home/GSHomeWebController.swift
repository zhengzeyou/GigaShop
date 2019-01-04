//
//  GSHomeWebController.swift
//  GigaShop
//
//  Created by ozawa on 2019/1/4.
//  Copyright © 2019 GIGA Korea. All rights reserved.
//

import UIKit
import WebKit
import JRefresh

class GSHomeWebController: BaseController {
	var webView:WKWebView!

	override func loadView()
	{
		super.loadView()
		tabBarController?.tabBar.isTranslucent = false
		
 
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.alpha = 0
 
	}
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
		navigationController?.navigationBar.shadowImage = nil
		navigationController?.navigationBar.alpha = 1
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
 		creaWKWebView()
 
	}
	
	private func creaWKWebView(){
		webView = WKWebView()
 		view.addSubview(webView)
		webView.load(NSURLRequest(url: URL(string: Constant.homeWebUrl)!) as URLRequest)
 		webView.snp.makeConstraints {
 			$0.edges.equalToSuperview()
//			$0.top.equalTo(-(navigationController?.navigationBar.height)! - UIApplication.shared.statusBarFrame.height )
		}
		
		webView.scrollView.header = JRefreshStateHeader.headerWithRefreshingBlock({[weak self] in
			guard self != nil else {return}
			DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
				self?.webView.scrollView.header?.endRefreshing()
			})
		})
		webView.scrollView.header?.beginRefreshing()

	}


}

extension GSHomeWebController:UIWebViewDelegate{
	
}
