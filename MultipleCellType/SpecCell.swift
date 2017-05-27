//
//  AttributeCell.swift
//  MultipleCellType
//
//  Created by Arash Z. Jahangiri on 5/27/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

import UIKit

class SpecCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var valueLabel: UILabel?
    
    var item: Specification?  {
        didSet {
            titleLabel?.text = item?.key
            valueLabel?.text = item?.value
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
