//
//  TabView.swift
//  MTViewer
//
//  Created by XUXIAOTENG on 23/04/2017.
//  Copyright © 2017 Bravesoft. All rights reserved.
//

import UIKit

class TabView: UIView {
    
    let lineHeight: CGFloat = 4.0
    var scrollView: UIScrollView!
    var selectedButton: UIButton!
    var lineView: UIView!
    var selectedIndex: Int {
        return selectedButton.tag - 1
    }
    var tabViewDidSelected: ((_ tabView: TabView, _ selectedIndex: Int, _ lastSelectedIndex: Int) -> Void)?

    convenience init(titles: [String]) {
        self.init(frame: CGRect.zero)
        
        scrollView = UIScrollView(frame: CGRect.zero)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = ColorManager.Color05.color()
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        scrollView.layoutIfNeeded()
        
        lineView = UIView(frame: CGRect(x: 0, y: 50.0 - lineHeight, width: 70.0, height: lineHeight))
        lineView.backgroundColor = ColorManager.Color02.color()
        scrollView.addSubview(lineView)
        
        setupTabs(titles: titles)
    }
    
    func setupTabs(titles: [String]) {
        for view in scrollView.subviews {
            if view is UIButton {
                view.removeFromSuperview()
            }
        }
        
        let height: CGFloat = 50.0
        var x: CGFloat = 0.0
        for (i, text) in titles.enumerated() {
            let font = UIFont.boldSystemFont(ofSize: 16.0)
            let attributes = [NSFontAttributeName: font]
            let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
            let rect = (text as NSString).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            var width: CGFloat = 0
            if rect.size.width < 60.0 {
                width = 70.0
            } else {
                width = rect.size.width + 10.0
            }
            
            let button = UIButton(type: .custom)
            button.tag = i + 1
            button.frame = CGRect(x: x, y: 0, width: width, height: height)
            button.setTitle(text, for: .normal)
            button.setTitleColor(ColorManager.Color03.color(), for: .normal)
            button.setTitleColor(ColorManager.Color03.color(), for: .highlighted)
            button.setTitleColor(ColorManager.Color02.color(), for: .selected)
            button.titleLabel?.font = font
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
            scrollView.addSubview(button)
            
            x += width;
            
            if (i == 0) {
                button.isSelected = true
                selectedButton = button
                updateLineView(button: button)
            }
        }
        scrollView.contentSize = CGSize(width: x, height: height)
    }
    
    func buttonClicked(_ button: UIButton) {
        if button != selectedButton {
            if let tabViewDidSelected = tabViewDidSelected {
                tabViewDidSelected(self, button.tag - 1, selectedIndex)
            }
            selectedButton.isSelected = false
            button.isSelected = true
            selectedButton = button
            updateLineView(button: button, animated: true)
        }
    }

    func updateLineView(button: UIButton, animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3, animations: { 
                self.updateLineView(button: button)
            })
        } else {
            self.updateLineView(button: button)
        }
    }
    
    func updateLineView(button: UIButton) {
        lineView.frame = CGRect(x: button.left, y: lineView.top, width: button.width, height: lineView.height)
    }
    
}
