//
//  CircleLayer.swift
//  004-一个复杂动画的实现
//
//  Created by 马遥 on 2018/1/23.
//  Copyright © 2018年 马遥. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {

    let kAnimationDuration: CFTimeInterval = 0.3
    let kAnimationStartTime: CFTimeInterval = 0.0
    
    var circleSmallPath: UIBezierPath {
        return UIBezierPath.init(ovalIn: CGRect.init(x: 50, y: 50, width: 0, height: 0))
    }
    
    var circleBigPath: UIBezierPath {
        return UIBezierPath.init(ovalIn: CGRect.init(x: 2.5, y: 2.5, width: 95, height: 95))
    }
    
    
    override init() {
        super.init()
        fillColor = UIColor.init(red: 218/255.0, green: 112/255.0, blue: 214/255.0, alpha: 1).cgColor
        path = circleSmallPath.cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func expandAnimation() {
        let expandAnimation: CABasicAnimation = CABasicAnimation.init(keyPath: "path")
        expandAnimation.fromValue = circleSmallPath.cgPath
        expandAnimation.toValue = circleBigPath.cgPath
        expandAnimation.duration = kAnimationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.isRemovedOnCompletion = false
        self.add(expandAnimation, forKey: nil)
        
    }
}
