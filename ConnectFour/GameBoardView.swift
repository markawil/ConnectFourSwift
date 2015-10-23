//
//  GameBoardView.swift
//  ConnectFour
//
//  Created by Mark Wilkinson on 10/22/15.
//  Copyright © 2015 Mark Wilkinson. All rights reserved.
//

import UIKit

class GameBoardView: UIView {
    
    var rows: Int?
    var columns: Int?
    
    convenience init(rows: Int, columns: Int) {
        self.init()
        self.rows = rows
        self.columns = columns
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
