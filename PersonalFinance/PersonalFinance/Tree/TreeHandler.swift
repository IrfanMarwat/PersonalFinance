//
//  TreeHandler.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import Foundation

@objc protocol TreeHandlerDelegate {
    func getButtonFrame() -> CGRect
}

class TreeHandler: NSObject {
    var nodes = Array<ParentTreeButton>()
    var delegate: TreeHandlerDelegate!
    var _nodeFactory: TreeFactory!
    var _view: UIView!
    
    init(nodeFactory: TreeFactory, view: UIView) {
        _nodeFactory = nodeFactory
        _view = view
    }
    
    func expandTree() {
        _nodeFactory.createDefault(delegate.getButtonFrame())
        let list = _nodeFactory.allItems
        for (index, child) in list.enumerate() {
            var frame = delegate.getButtonFrame()
            frame.size.width -= 3
            frame.size.height -= 3
            frame.origin.x += 1
            
            child.frame = frame
            
            _view.addSubview(child)
            
            let difference = Int(child.frame.size.height)*(index+1)+(9*(index+1))
            let y = (Int(delegate.getButtonFrame().origin.y) + difference)
            
            let newFrame = CGRectMake(child.frame.origin.x, CGFloat(y), child.frame.size.width, child.frame.size.height)
            
            UIView.animateWithDuration(0.4, animations: {
                child.frame = newFrame
            })
        }
    }
    
    func collapseTree() {
        let list = _nodeFactory.allItems
        for child in list {
            UIView.animateWithDuration(0.4, animations: {
                var frame = self.delegate.getButtonFrame()
                frame.size.width -= 3
                frame.size.height -= 3
                frame.origin.x += 1
                
                child.frame = frame
                
                }, completion: { (finished: Bool) in
                    child.removeFromSuperview()
            })
        }
    }
}