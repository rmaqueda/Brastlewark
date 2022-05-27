//
//  DetailsView.swift
//  Brastlewark
//
//  Created by Maqueda, Ricardo Javier on 24/5/22.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack {
            // TODO: Finish detail view
            AsyncImage(url: URL(string: viewModel.gnome.thumbnail)) { image in
                image
                    .resizable()
                    .frame(height: 600)
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
            } placeholder: {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.gnome.name)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let gnome = Bundle.brastlewarkResponse.gnomes[0]
        NavigationView {
            DetailsView(viewModel: DetailsView.ViewModel(gnome: gnome))
        }
        .navigationTitle(gnome.name)
    }
}
