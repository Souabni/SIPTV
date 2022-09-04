//
//  SeriesView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI

struct SeriesView: View {
    @EnvironmentObject var currentSession : XtreamSession
    
    @State private var selectedCategory : SeriesCategory?
    @State private var displaySelectedCategory : Bool = false
    
    @State private var selectedSerie : Serie?
    @State private var displaySerie : Bool = false
    
    var body: some View {
        let selectedCategoryBinding = Binding(
            get: { self.selectedCategory },
            set: { self.selectedCategory = $0
                displaySelectedCategory = true
            }
        )
        
        let selectedSerieBinding = Binding(
            get: { self.selectedSerie },
            set: { self.selectedSerie = $0
                displaySerie = true
            }
        )
        
        ScrollView{
            VStack{
                Spacer()
                    .frame(height: 84)
                let gridItemLayout = [GridItem(.flexible())]
                LazyVGrid(columns: gridItemLayout){
                    ForEach(currentSession.seriesCategories,id:\.title){category in
                        SerieCategoryView(category: category, selectedCategory: selectedCategoryBinding, selectedSerie: selectedSerieBinding)
                    }
                }
                Spacer()
                NavigationLink(destination: SerieCategoryDetailsView(category: selectedCategory),
                               isActive: $displaySelectedCategory) {
                    EmptyView()
                }
            }
        }
        .background(Color.black)
        .fullScreenCover(isPresented: $displaySerie) {
            if let selectedSerie = self.selectedSerie{
                SerieDetailsView(serieDetailsVM: SerieDetailsViewModel(selectedSerie: selectedSerie))
            }
        }
    }
}

