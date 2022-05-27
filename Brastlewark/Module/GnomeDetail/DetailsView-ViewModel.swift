//
//  DetailsView-ViewModel.swift
//  Brastlewark
//
//  Created by Maqueda, Ricardo Javier on 24/5/22.
//

import Foundation

extension DetailsView {
    class ViewModel: ObservableObject {
        @Published var gnome: Gnome

        init(gnome: Gnome) {
            self.gnome = gnome
        }
    }
}
