//
//  SavedDate.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/31/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct SavedDate: Codable {
    var date: String
    
    init(date: String) {
        self.date = date
    }
}
