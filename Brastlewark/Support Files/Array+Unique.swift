//
//  Array+Unique.swift
//  Brastlewark
//
//  Created by Maqueda, Ricardo Javier on 25/5/22.
//

import Foundation

extension Array where Element: Equatable {

    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
    
}
