//
//  GnomeCellView.swift
//  Brastlewark
//
//  Created by Maqueda, Ricardo Javier on 25/5/22.
//

import SwiftUI

struct GnomeCellView: View {
    @State var gnome: Gnome
    @State var gnomes: [Gnome]

    var body: some View {
        NavigationLink {
            DetailsView(viewModel: DetailsView.ViewModel(gnome: gnome))
        } label: {
            VStack {
                CachedAsyncImage(url: URL(string: gnome.thumbnail)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }

                VStack {
                    Text(gnome.name)
                        .font(.body)
                        .frame(width: 160, height: 10)

                    Text(gnome.ageString)
                        .font(.caption)
                }
                .foregroundColor(.white)
                .padding([.bottom, .top])
            }
        }
        .background(gnome.hairColor.color)
        .cornerRadius(10)
    }
}

struct GnomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        let gnomes = Bundle.brastlewarkResponse.gnomes
        GnomeCellView(gnome: gnomes[0], gnomes: gnomes)
            .previewLayout(.fixed(width: 300, height: 300))
        
    }
}
