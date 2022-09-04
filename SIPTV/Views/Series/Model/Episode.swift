//
//  Episode.swift
//  SIPTV
//
//  Created by Souabni Issam on 02/09/2022.
//

import Foundation

class Episode: ObservableObject{
    
    var id: String
    var episodeNum: Int
    var title: String
    var description: String
    var coverUrl: String
    
    internal init(id: String, episodeNum: Int, title: String,description: String,coverUrl:String) {
        self.id = id
        self.episodeNum = episodeNum
        self.title = title
        self.description = description
        self.coverUrl = coverUrl
    }
    
}
