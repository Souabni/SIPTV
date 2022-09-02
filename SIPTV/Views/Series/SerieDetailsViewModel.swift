//
//  SerieDetailsViewModel.swift
//  SIPTV
//
//  Created by Souabni Issam on 02/09/2022.
//

import Foundation

class SerieDetailsViewModel: ObservableObject{
    var selectedSerie : Serie
    
    
    @Published var coverURL: String
    @Published var title: String
    @Published var rating: Double
    @Published var description: String
    
    init(selectedSerie : Serie){
        self.selectedSerie = selectedSerie
        XtreamManager.shared.currentSession.xtreamAgent.getSeriesInfo(seriesID: selectedSerie.serieID) { serieInfo in
            print(serieInfo)
            selectedSerie.set(info: serieInfo)
        }
    }
}
