//
//  SerieDetailsViewModel.swift
//  SIPTV
//
//  Created by Souabni Issam on 02/09/2022.
//

import Foundation

class SerieDetailsViewModel: ObservableObject{
    @Published var selectedSerie : Serie
   
    @Published var selectedSection : String = "Saison 1"

    @Published var selectedEpisodeID : String = ""
    @Published var displayVideo : Bool = false
    
  
    
    init(selectedSerie : Serie){
        self.selectedSerie = selectedSerie
       
    }
    
    func getSerieInfo(){
        XtreamManager.shared.currentSession.xtreamAgent.getSeriesInfo(seriesID: selectedSerie.serieID) { serieInfo in
            DispatchQueue.main.async {
            print(serieInfo)
            self.selectedSerie.set(info: serieInfo)
            self.objectWillChange.send()
            }
        }
    }
}
