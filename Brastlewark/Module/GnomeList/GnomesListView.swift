//
//  ContentView.swift
//  Brastlewark
//
//  Created by Maqueda, Ricardo Javier on 24/5/22.
//

import SwiftUI

struct GnomesListView: View {
    @StateObject var viewModel: GnomeListViewModel
    @State var isFilterByColor = false
    @State var searchText = ""
    @State var hairColorFilter: HairColor?

    private let columns = [ GridItem(.adaptive(minimum: 180)) ]

    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    ForEach(viewModel.hairColors) { hairColor in
                        Circle()
                            .fill(hairColor.color)
                            .frame(width: 25, height: 25)
                            .onTapGesture {
                                viewModel.filter(searchText: searchText, hairColor: hairColor)
                                hairColorFilter = hairColor
                                isFilterByColor = true
                            }
                    }
                    if isFilterByColor {
                        ZStack {
                            Circle().stroke(.gray)
                            Text("X")
                        }
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                            viewModel.filter(searchText: searchText, hairColor: nil)
                            isFilterByColor = false
                            hairColorFilter = nil
                        }
                    }
                }
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.gnomes) { gnome in
                        GnomeCellView(gnome: gnome, gnomes: viewModel.result)
                    }
                }
            }
            .navigationBarTitle("Brastlewark")
        }
        .navigationViewStyle(.stack)
        .searchable(
            text: $searchText
        )
        .onChange(of: searchText) { newQuery in
            viewModel.filter(searchText: newQuery, hairColor: hairColorFilter)
        }
        .alert(
            "Network Error",
            isPresented: $viewModel.showError,
            actions: { },
            message: {
                Text(viewModel.errorText)
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        let viewModel = GnomeListViewModel(session: URLSession.stubResponse)
        
        Group {
            GnomesListView(viewModel: viewModel)
                .previewDevice("iPhone 12 Pro")
                .previewDisplayName("iPhone 12 Pro")

            GnomesListView(viewModel: viewModel)
                .previewDevice("iPhone 12 Pro Max")
                .previewDisplayName("iPhone 12 Pro Max")
                .previewInterfaceOrientation(.landscapeRight)

            GnomesListView(viewModel: viewModel)
                .previewDevice("iPad (9th generation)")
                .previewDisplayName("iPad (9th generation)")
        }
    }
    
}
