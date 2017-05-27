//
//  ProfileModel.swift
//  MultipleCellType
//
//  Created by Arash Z. Jahangiri on 5/27/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

import Foundation

public func dataFromFile(_ filename: String) -> Data? {
    @objc class TestClass: NSObject { }
    
    let bundle = Bundle(for: TestClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return (try? Data(contentsOf: URL(fileURLWithPath: path)))
    }
    return nil
}

class Profile {
    var fullName: String?
    var pictureUrl: String?
    var producer: String?
    var about: String?
    var similarCar = [SimilarCar]()
    var specification = [Specification]()
    
    init?(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any], let body = json["data"] as? [String: Any] {
                self.fullName = body["fullName"] as? String
                self.pictureUrl = body["pictureUrl"] as? String
                self.about = body["about"] as? String
                self.producer = body["producer"] as? String
                
                if let similarCar = body["similarCars"] as? [[String: Any]] {
                    self.similarCar = similarCar.map { SimilarCar(json: $0) }
                }
                
                if let spec = body["spec"] as? [[String: Any]] {
                    self.specification = spec.map { Specification(json: $0) }
                }
            }
        } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
    }
}

class SimilarCar {
    var name: String?
    var pictureUrl: String?
    
    init(json: [String: Any]) {
        self.name = json["name"] as? String
        self.pictureUrl = json["pictureUrl"] as? String
    }
}

class Specification {
    var key: String?
    var value: String?
    
    init(json: [String: Any]) {
        self.key = json["key"] as? String
        self.value = json["value"] as? String
    }
}
