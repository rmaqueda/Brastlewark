//
//  Bundle+JSON.swift
//  BrastlewarkTests
//
//  Created by Maqueda, Ricardo Javier on 24/5/22.
//

import Foundation

extension Bundle {

    static var brastlewarkResponse: BrastlewarkResponse {
        let bundle = Bundle.main
        let url = bundle.url(forResource: "BrastlewarkResponse", withExtension: "json")!
        let data = try! Data(contentsOf: url)

        return try! JSONDecoder().decode(BrastlewarkResponse.self, from: data)
    }

}
