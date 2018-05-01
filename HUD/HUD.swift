//
//  HUD.swift
//  MTViewer
//
//  Created by XUXIAOTENG on 17/05/2017.
//  Copyright © 2017 Bravesoft. All rights reserved.
//

import UIKit

class HUD: UIView {
    
    public var containerView: UIView? = nil
    public var offset: CGFloat = 0
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.color = UIColor.gray
        return activity
    }()
    
    public convenience init(container view: UIView) {
        self.init()
        containerView = view
    }
    
    public func show() {
        if let view = containerView {
            if  !view.subviews.contains(self) {
                self.frame.origin = CGPoint.zero
                self.frame.size = view.frame.size
                self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                view.addSubview(self)
                
                self.addSubview(activityIndicatorView)
                activityIndicatorView.center = CGPoint(x: self.center.x, y: self.center.y - offset)
                activityIndicatorView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            }
            activityIndicatorView.startAnimating()
        }
    }

    open class func show(inView view: UIView? = nil) {
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        let hud = HUD(container: view)
        hud.show()
    }
    
    open class func show(inView view: UIView? = nil, color: UIColor) {
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        let hud = HUD(container: view)
        hud.activityIndicatorView.color = color
        hud.show()
    }
    
    open class func show(inView view: UIView? = nil, color: UIColor, offset: CGFloat) {
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        let hud = HUD(container: view)
        hud.activityIndicatorView.color = color
        hud.offset = offset
        hud.show()
    }
    
    open class func show(inView view: UIView? = nil, interaction: Bool) {
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        let hud = HUD(container: view)
        hud.isUserInteractionEnabled = interaction
        hud.show()
    }
    
    open class func hide(forView view: UIView? = nil) {
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        for subView in view.subviews {
            if subView is HUD {
                if let hud = subView as? HUD {
                    UIView.animate(withDuration: 0.3, animations: {
                        hud.alpha = 0.0
                    }, completion: { (finished) in
                        hud.removeFromSuperview()
                    })
                }
            }
        }
    }

}
