//
//  GSGoodSelectSizeCountView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

 
class GSAddShopCartTool: NSObject {

	/*加入购物车的动画效果
 	 - Parameters:
	   - goodsImage: 商品图片
	   - startPoint: 动画起点
	   - endPoint: 动画终点
	   - completion: 动画执行完成后的回调
 	*/
	class func addToShoppingCartWithGoodsImage(goodsImage:UIImage,startPoint:CGPoint,endPoint:CGPoint,completion:@escaping (Bool)->Void){

		let animationLayer:CAShapeLayer = CAShapeLayer()
		animationLayer.cornerRadius = 20
		animationLayer.masksToBounds = true
		animationLayer.frame = CGRect(x: startPoint.x-20 , y: startPoint.y-20, width: 40, height: 40)
		animationLayer.contents = goodsImage.cgImage


		var rootVC:UIViewController = (UIApplication.shared.delegate?.window??.rootViewController)!
		while rootVC.presentedViewController != nil {
			rootVC = rootVC.presentedViewController!
		}
		while rootVC.isKind(of: UINavigationController.self) {
			rootVC = (rootVC as? UINavigationController)!.topViewController!
		}
		rootVC.view.layer.addSublayer(animationLayer)


		let movePath:UIBezierPath = UIBezierPath()
		movePath.move(to: startPoint)
		movePath.addQuadCurve(to: endPoint, controlPoint: CGPoint(x: Constant.screenWidth/3, y: 300))

		let pathAnimation:CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
		pathAnimation.duration = 1.0
		pathAnimation.isRemovedOnCompletion = false
		pathAnimation.fillMode = .forwards
		pathAnimation.path = movePath.cgPath


		let scaleAnimation:CABasicAnimation = CABasicAnimation.init(keyPath: "transform.scale")
		scaleAnimation.fromValue = NSNumber.init(value: 1.0)
		scaleAnimation.toValue = NSNumber.init(value: 0.5)
		scaleAnimation.duration = 1.0
		scaleAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
		scaleAnimation.isRemovedOnCompletion = false
		scaleAnimation.fillMode = .forwards


		animationLayer.add(pathAnimation, forKey: nil)
		animationLayer.add(scaleAnimation, forKey: nil)

		DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute:
			{
				animationLayer.removeFromSuperlayer()
				completion(true)

		})
	}


}
