//
//  Device.swift
//  3.3 Paired Assignment
//
//  Created by Jake Gloschat on 2/15/23.
//

import Foundation

class Device: Codable {
    let name: String
    var isOn: Bool
    
    init(name: String, isOn: Bool = false) {
        self.name = name
        self.isOn = isOn
    }
}
