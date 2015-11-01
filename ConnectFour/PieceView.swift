//
//  PieceView.swift
//  ConnectFour
//
//  Created by Mark Wilkinson on 11/1/15.
//  Copyright © 2015 Mark Wilkinson. All rights reserved.
//

import UIKit

class PieceView: UIView {
    
    init(frame: CGRect, pieceColor: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = pieceColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
}
