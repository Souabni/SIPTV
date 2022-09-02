//
//  XtreamSession.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

class XtreamSession: ObservableObject{
    
    var profil: Profil
    let xtreamAgent : XtreamAgent
    
    @Published var moviesCategories : [MoviesCategory] = []
    @Published var seriesCategories : [SeriesCategory] = []
    var liveTVsCategories : [LiveTvCategory] = []
    
    var nbLoadedMoviesCategories = 0
    var nbLoadedSeriesCategories = 0
    
    init(profil:Profil){
        self.profil = profil
        xtreamAgent  = XtreamAgent(profil: profil)
        loadSession()
    }
    
    func loadSession(){
        loadMoviesCategories()
        loadSeriesCategories()
       // loadSeries()
        loadLives()
    }
    
    func loadMoviesCategories(){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getVodCategories{categories in
            DispatchQueue.main.async {
                
                for category in categories {
                    print(category.title)
                    let moviesCategory = MoviesCategory(category: category)
                    self.moviesCategories.append(moviesCategory)
                }
                self.loadMovies()
            }
        }
    }
    
    func loadMovies(){
        
        if self.nbLoadedMoviesCategories < moviesCategories.count{
            loadMovies(for: moviesCategories[nbLoadedMoviesCategories]) {
                self.nbLoadedMoviesCategories += 1
                self.loadMovies()
            }
        }
    }
    
    func loadMovies(for category:MoviesCategory, completion:@escaping ()->()){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getVodStreams(categoryID: category.id) { vodStreams in
            DispatchQueue.main.async {
                let movieModels = vodStreams.map { vodStream in
                    Movie(movieStream: vodStream, profil: self.profil)
                }
                category.movies =  movieModels
                completion()
            }
        }
    }
    
    
    func loadSeriesCategories(){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getSeriesCategories{categories in
            DispatchQueue.main.async {
                
                for category in categories {
                    print(category.title)
                    let seriesCategory = SeriesCategory(category: category)
                    self.seriesCategories.append(seriesCategory)
                }
                self.loadSeries()
            }
        }
    }
    
    func loadSeries(){
        
        if self.nbLoadedSeriesCategories < seriesCategories.count{
            loadSeries(for: seriesCategories[nbLoadedSeriesCategories]) {
                self.nbLoadedSeriesCategories += 1
                self.loadSeries()
            }
        }
    }
    
    func loadSeries(for category:SeriesCategory, completion:@escaping ()->()){
        let xtreamAgent = XtreamAgent(profil: profil)
        xtreamAgent.getSeriesStreams(categoryID: category.id) { serieStreams in
            DispatchQueue.main.async {
                let serieModels = serieStreams.map { serieStream in
                    Serie(serieStream: serieStream, profil: self.profil)
                }
                category.series =  serieModels
                completion()
            }
        }
    }
    
    func loadLives(){
        
    }
}
