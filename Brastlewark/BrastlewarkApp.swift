//
//  BrastlewarkApp.swift
//  Brastlewark
//
//  Created by Maqueda, Ricardo Javier on 24/5/22.
//

import SwiftUI

@main
struct BrastlewarkApp: App {
    var body: some Scene {
        WindowGroup {
            GnomesListView(viewModel: GnomeListViewModel())
        }
    }

}
