//
//  Serie.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import Foundation

class Serie: ObservableObject{
    var serieID: Int
    var name : String
    var coverUrl: String
    @Published var episodes: [[Episode]] = []
    
    @Published var info: SerieInfo?
    
    init(serieStream:SeriesStream, profil: Profil){
        self.serieID = serieStream.seriesID ?? 0
        self.name = serieStream.name ?? ""
       
        self.coverUrl = serieStream.cover ?? ""
    }
   
    func set(info:SerieInfo){
        self.info = info
        if let keys = info.episodes?.keys{
            for key in keys.sorted(by: <){
                if let season = info.episodes?[key]{
                    var seasonEpisodes : [Episode] = []
                    for episode in season{
                        seasonEpisodes.append(episode)
                    }
                    episodes.append(seasonEpisodes)
                }

            }
        }
        
    }
}
