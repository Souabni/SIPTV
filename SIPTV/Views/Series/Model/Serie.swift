//
//  Serie.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import Foundation

class Serie: ObservableObject{
    
    @Published var serieID: Int
    @Published var name : String
    @Published var iconUrl: String
    @Published var coverUrl: String?
    @Published var description: String
    @Published var rating5based: Double?
    @Published var genre: String?
    @Published var cast: String?
    
    var seasonsInfo: [Season] = []
    @Published var seasons: [Season] = []
    
    @Published var info: SerieInfo?
    
    init(serieStream:SeriesStream, profil: Profil){
        self.serieID = serieStream.seriesID ?? 0
        self.name = serieStream.name ?? ""
        self.iconUrl = serieStream.cover ?? ""
        self.description = serieStream.plot ?? ""
  
    }
   
    func set(info:SerieInfo){
        self.info = info
        self.rating5based = info.info?.rating5based
        self.genre = info.info?.genre
        self.cast = info.info?.cast
        
        if let seasonsInfos = info.seasons{
            for seasonInfo in seasonsInfos{
                let season = Season()
                season.name = seasonInfo.name ?? ""
                season.seasonNumber = seasonInfo.seasonNumber ?? 0
                self.seasonsInfo.append(season)
            }
        }
        
        if let keys = info.episodes?.keys{
            for key in keys.sorted(by: <){
           
                if let seasonInfo = info.episodes?[key]{
                    let season = Season()
                    for episodeInfo in seasonInfo{
                        let episode = Episode(id: episodeInfo.id ?? "", episodeNum: episodeInfo.episodeNum ?? 0, title: episodeInfo.title ?? "",description: episodeInfo.info?.plot ?? "",coverUrl: episodeInfo.info?.movieImage ?? "")
                        season.episodes.append(episode)
                    }
                     if let seasonInfo = seasonsInfo.filter({String($0.seasonNumber) == key}).first{
                         season.name = seasonInfo.name
                         season.seasonNumber = seasonInfo.seasonNumber
                     }
                    seasons.append(season)
                }
                
            }
        }
        
    }
}
