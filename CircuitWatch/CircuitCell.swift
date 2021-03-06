//
//  CircuitCell.swift
//  CircuitWatch
//
//  Created by 홍창남 on 2017. 2. 23..
//  Copyright © 2017년 홍창남. All rights reserved.
//

import UIKit

class CircuitCell: UITableViewCell {

    @IBOutlet weak var trainingTitle: UILabel!
    @IBOutlet weak var trainingTime: UILabel!
    @IBOutlet weak var trainingDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if UIDevice.current.isiPadPro12 || UIDevice.current.isiPad {
            trainingTime.frame.size.width = 160
        } else {
            trainingTime.frame.size.width = 130
        }
    }
    
}
