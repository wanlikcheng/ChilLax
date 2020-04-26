//
//  FavoriteTableViewCell.swift
//  ChilLax
//
//  Created by Kelvin Cheng on 4/25/20.
//  Copyright © 2020 Kelvin Cheng. All rights reserved.
//

import UIKit

protocol FavoriteTableViewCellDelegate: class {
    func likedButtonToggle(sender: FavoriteTableViewCell)
}

class FavoriteTableViewCell: UITableViewCell {
    
    weak var delegate: FavoriteTableViewCellDelegate?

    @IBOutlet weak var likedButton: UIButton!
    @IBOutlet weak var soundNameLabel: UILabel!
    
    @IBAction func likedToggle(_ sender: UIButton) {
        delegate?.likedButtonToggle(sender: self)
    }
}
