//
//  GameBoardView.swift
//  ConnectFour
//
//  Created by Mark Wilkinson on 10/22/15.
//  Copyright © 2015 Mark Wilkinson. All rights reserved.
//

import UIKit

let kPadding: CGFloat = 4.0

class GameBoardView: UIView {
    
    var rows = 1
    var columns = 1
    
    convenience init(rows: Int, columns: Int) {
        self.init()
        self.rows = rows
        self.columns = columns
        self.translatesAutoresizingMaskIntoConstraints = false
        self.opaque = false
    }
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        super.updateConstraints()

        let aspectRatio = (CGFloat(self.columns) / CGFloat(self.rows))
        let aMultiplier = CGFloat(1/aspectRatio)
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: aMultiplier, constant: 0))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("[self(>=200)]", options: NSLayoutFormatOptions.AlignAllBaseline, metrics: nil, views: ["self":self]))
    }
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextBeginPath(context)
        CGContextAddRect(context, self.bounds)
        
        let innerRect = CGRectInset(self.bounds, kPadding, kPadding)
        let squareSize = innerRect.size.width / CGFloat(self.columns)
        CGContextTranslateCTM(context, kPadding, kPadding)
        for _ in 0...self.rows-1 {
            for _ in 0...self.columns-1 {
                let holeSize = squareSize - kPadding * 2
                let holeRect = CGRectMake(kPadding, kPadding, holeSize, holeSize)
                CGContextAddEllipseInRect(context, holeRect)
                // like a typewriter the context is the positioning of where to print
                CGContextTranslateCTM(context, squareSize, 0)
            }
            // like a typewriter, start back at the beginning on a new row
            CGContextTranslateCTM(context, -innerRect.size.width, squareSize)
        }
        
        CGContextSetFillColorWithColor(context, UIColor(red: 0.822, green: 0.822, blue: 0.000, alpha: 1.0).CGColor)
        CGContextEOFillPath(context)
        
        CGContextRestoreGState(context)
    }
}
