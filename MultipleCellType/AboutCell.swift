//
//  AboutCell.swift
//  MultipleCellType
//
//  Created by Arash Z. Jahangiri on 5/27/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel?
    
    var item: ProfileViewModelItem? {
        didSet {
            guard  let item = item as? ProfileViewModelAboutItem else {
                return
            }
            
            aboutLabel?.text = item.about
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
