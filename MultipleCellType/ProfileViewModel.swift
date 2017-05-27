//
//  ProfileViewModel.swift
//  MultipleCellType
//
//  Created by Arash Z. Jahangiri on 5/27/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

import Foundation

enum ProfileViewModelItemType {
    case nameAndPicture
    case about
    case producer
    case friend
    case specification
}

protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

class ProfileViewModel {
    var items = [ProfileViewModelItem]()
    
    init() {
        guard let data = dataFromFile("Data"), let profile = Profile(data: data) else {
            return
        }
        
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
            items.append(nameAndPictureItem)
        }
        
        if let about = profile.about {
            let aboutItem = ProfileViewModelAboutItem(about: about)
            items.append(aboutItem)
        }
        
        if let producer = profile.producer {
            let dobItem = ProfileViewModelProducerItem(producer: producer)
            items.append(dobItem)
        }
        
        let specifications = profile.specification
        if !specifications.isEmpty {
            let specItem = ProfileViewModeSpecItem(specifications: specifications)
            items.append(specItem)
        }
        
        let similarCars = profile.similarCar
        if !profile.similarCar.isEmpty {
            let similarItem = ProfileViewModeSimilarItem(similarCars: similarCars)
            items.append(similarItem)
        }        
    }
}

class ProfileViewModelNamePictureItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .nameAndPicture
    }
    
    var sectionTitle: String {
        return "Name"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var name: String
    var pictureUrl: String
    
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
}

class ProfileViewModelAboutItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .about
    }
    
    var sectionTitle: String {
        return "About"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var about: String
    
    init(about: String) {
        self.about = about
    }
}

class ProfileViewModelProducerItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .producer
    }
    
    var sectionTitle: String {
        return "Producer"
    }
    
    var rowCount: Int {
        return 1
    }
    
    var producer: String
    
    init(producer: String) {
        self.producer = producer
    }
}

class ProfileViewModeSpecItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .specification
    }
    
    var sectionTitle: String {
        return "Specification"
    }
    
    var rowCount: Int {
        return specifications.count
    }
    
    var specifications: [Specification]
    
    init(specifications: [Specification]) {
        self.specifications = specifications
    }
}

class ProfileViewModeSimilarItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .friend
    }
    
    var sectionTitle: String {
        return "Similar Cars"
    }
    
    var rowCount: Int {
        return similarCars.count
    }
    
    var similarCars: [SimilarCar]
    
    init(similarCars: [SimilarCar]) {
        self.similarCars = similarCars
    }
}


