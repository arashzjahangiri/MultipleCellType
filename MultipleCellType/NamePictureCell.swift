//
//  NamePictureCell.swift
//  MultipleCellType
//
//  Created by Arash Z. Jahangiri on 5/27/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

import UIKit

class NamePictureCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var pictureImageView: UIImageView?
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelNamePictureItem else {
                return
            }
            
            nameLabel?.text = item.name
            pictureImageView?.image = UIImage(named: item.pictureUrl)
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pictureImageView?.layer.cornerRadius = 50
        pictureImageView?.clipsToBounds = true
        pictureImageView?.contentMode = .scaleAspectFit
        pictureImageView?.backgroundColor = UIColor.lightGray
    }
}
