//
//  ViewController.swift
//  MultipleCellType
//
//  Created by Arash Z. Jahangiri on 5/27/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(AboutCell.nib, forCellReuseIdentifier: AboutCell.identifier)
        tableView.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.identifier)
        tableView.register(SimilarCell.nib, forCellReuseIdentifier: SimilarCell.identifier)
        tableView.register(SpecCell.nib, forCellReuseIdentifier: SpecCell.identifier)
        tableView.register(ProducerCell.nib, forCellReuseIdentifier: ProducerCell.identifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items[section].rowCount
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.section]
        switch item.type {
        case .nameAndPicture:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureCell.identifier, for: indexPath) as? NamePictureCell {
                cell.item = item
                return cell
            }
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.identifier, for: indexPath) as? AboutCell {
                cell.item = item
                return cell
            }
        case .producer:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ProducerCell.identifier, for: indexPath) as? ProducerCell {
                cell.item = item
                return cell
            }
        case .friend:
            if let item = item as? ProfileViewModeSimilarItem, let cell = tableView.dequeueReusableCell(withIdentifier: SimilarCell.identifier, for: indexPath) as? SimilarCell {
                let friend = item.similarCars[indexPath.row]
                cell.item = friend
                return cell
            }
        case .specification:
            if let item = item as? ProfileViewModeSpecItem, let cell = tableView.dequeueReusableCell(withIdentifier: SpecCell.identifier, for: indexPath) as? SpecCell {
                cell.item = item.specifications[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.items[section].sectionTitle
    }
}


