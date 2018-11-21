//
//  CMToolExtension.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import RxSwift
extension UIButton {
	
	@objc func set(image anImage: UIImage?, title: String,
				   titlePosition: UIView.ContentMode, additionalSpacing: CGFloat, state: UIControl.State){
		self.imageView?.contentMode = .center
		self.setImage(anImage, for: state)
		
		positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
		
		self.titleLabel?.contentMode = .center
		self.setTitle(title, for: state)
	}
	
	private func positionLabelRespectToImage(title: String, position: UIView.ContentMode,
											 spacing: CGFloat) {
		let imageSize = self.imageRect(forContentRect: self.frame)
		let titleFont = self.titleLabel?.font!
		let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: titleFont!])
		
		var titleInsets: UIEdgeInsets
		var imageInsets: UIEdgeInsets
		
		switch (position){
		case .top:
			titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
									   left: -(imageSize.width), bottom: 0, right: 0)
			imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
		case .bottom:
			titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
									   left: -(imageSize.width), bottom: 0, right: 0)
			imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
		case .left:
			titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
			imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
									   right: -(titleSize.width * 2 + spacing))
		case .right:
			titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
			imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		default:
			titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
			imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		}
		
		self.titleEdgeInsets = titleInsets
		self.imageEdgeInsets = imageInsets
	}
}

extension UILabel {

	static func getTextHeigh(content:String,font:CGFloat,width:CGFloat) -> CGFloat {
		let normalText: String = content
		let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
		let dic = NSDictionary(object: UIFont.systemFont(ofSize: font), forKey: NSAttributedString.Key.font as NSCopying)
		let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any] , context:nil).size
		return stringSize.height
	}
	

	static func getTexWidth(content:String,font:CGFloat,height:CGFloat) -> CGFloat {
		let normalText: String = content
 		let size = CGSize(width: 1000, height: height)
 		let dic = NSDictionary(object: UIFont.systemFont(ofSize: font), forKey: NSAttributedString.Key.font as NSCopying)
 		let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any] , context:nil).size
 		return stringSize.width
		
	}
 }



extension UIColor {
	
	static func rgba(r: CGFloat, g: CGFloat, b: CGFloat,a: CGFloat) -> UIColor {
		
		return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
	}
	
	static func colorFromHex(hex: UInt32) -> UIColor {
		
		return UIColor.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
							green: CGFloat((hex & 0xFF00) >> 8) / 255.0,
							blue: CGFloat((hex & 0xFF)) / 255.0,
							alpha: 1.0)
	}
	
}

extension String {
	
	static func  getStringSize(text: String, rectSize: CGSize,fontSize: CGFloat) -> CGSize {
		
		let str = text as NSString
		
		
		let rect = str.boundingRect(with: rectSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: fontSize)], context: nil)
		
		return rect.size
	}
	

	public func localized() ->String{
		
		return NSLocalizedString(self, comment: "Localizable")
	}

	
}

extension UIView {
	
	public var x: CGFloat{
		get{
			return self.frame.origin.x
		}
		set{
			var r = self.frame
			r.origin.x = newValue
			self.frame = r
		}
	}
	
	public var y: CGFloat{
		get{
			return self.frame.origin.y
		}
		set{
			var r = self.frame
			r.origin.y = newValue
			self.frame = r
		}
	}
	
	
	public var left: CGFloat{
		
		get {
			return self.frame.origin.x
		}
		set{
			
			var r = self.frame
			r.origin.x = newValue
			self.frame = r
		}
		
	}
	
	
	public var right: CGFloat{
		
		get {
			return self.frame.origin.x + self.frame.size.width
		}
		set{
			
			var r = self.frame
			r.origin.x = newValue - r.size.width
			self.frame = r
		}
		
	}
	
	public var top: CGFloat{
		
		get {
			return self.frame.origin.y
		}
		set{
			
			var r = self.frame
			r.origin.y = newValue
			self.frame = r
		}
		
	}
	
	
	public var bottom: CGFloat{
		
		get {
			return self.frame.origin.y+self.frame.size.height
		}
		set{
			
			var r = self.frame
			r.origin.y = newValue - self.frame.size.height
			self.frame = r
		}
		
	}
	
	public var width: CGFloat{
		
		get {
			return self.frame.size.width
		}
		set{
			
			var r = self.frame
			r.size.width = newValue
			self.frame = r
		}
		
	}
	
	public var height: CGFloat{
		
		get {
			return self.frame.size.height
		}
		set{
			
			var r = self.frame
			r.size.height = newValue
			self.frame = r
		}
		
	}
	
	public var zj_origin: CGPoint{
		
		get {
			return self.frame.origin
		}
		set{
			
			var r = self.frame
			r.origin = newValue
			self.frame = r
		}
		
	}
	
	public func viewForController(view:UIView)->UIViewController?{
		var next:UIView? = view
		repeat{
			if let nextResponder = next?.next, nextResponder is UIViewController {
				return (nextResponder as! UIViewController)
			}
			next = next?.superview
		}while next != nil
		return nil
	}

	
 }
