//
//  GnomeListViewModel.swift
//  Brastlewark
//
//  Created by Maqueda, Ricardo Javier on 24/5/22.
//

import SwiftUI
import Combine

class GnomeListViewModel: ObservableObject {
    @Published var result: [Gnome] = []
    private var gnomeByText: [Gnome] = []

    @Published var gnomes: [Gnome] = [] {
        didSet {
            createHairColorsFilter()
        }
    }
    var hairColors: [HairColor] = []

    @Published var errorText: String = ""
    @Published var showError: Bool = false

    private let session: URLSession
    private var cancellables = Set<AnyCancellable>()
    private let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json")!

    init(session: URLSession = URLSession.bigCache) {
        self.session = session
        getData()
    }

    private func getData() {
        session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: BrastlewarkResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.errorText = error.localizedDescription
                    self?.showError = true
                }
            }, receiveValue: { [weak self] response in
                self?.result = response.gnomes
                self?.gnomes = response.gnomes
            })
            .store(in: &cancellables)
    }

    func filter(searchText: String, hairColor: HairColor? = nil) {
        if searchText.isEmpty && hairColor == nil {
            gnomes = result
            return
        }

        if !searchText.isEmpty {
            gnomeByText = result.filter {
                $0.name.lowercased().starts(with: searchText.lowercased())
            }
        } else {
            gnomeByText = gnomes
        }

        gnomes = gnomeByText.filter {
            if !searchText.isEmpty, let hairColor = hairColor {
                return $0.name.lowercased().contains(searchText.lowercased()) && $0.hairColor == hairColor
            } else if !searchText.isEmpty, hairColor == nil {
                return $0.name.lowercased().starts(with: searchText.lowercased())
            } else if let hairColor = hairColor {
                return $0.hairColor == hairColor
            } else {
                return false
            }
        }
    }

    private func createHairColorsFilter() {
        hairColors = gnomes.map { gnome in
            gnome.hairColor
        }
        .unique
        .sorted()
    }
    
}
