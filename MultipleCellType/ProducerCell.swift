//
//  EmailCell.swift
//  MultipleCellType
//
//  Created by Arash Z. Jahangiri on 5/27/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

import UIKit

class ProducerCell: UITableViewCell {

    @IBOutlet weak var producerLabel: UILabel?
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelProducerItem else {
                return
            }
            
            producerLabel?.text = item.producer
        }
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
