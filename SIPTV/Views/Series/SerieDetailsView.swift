//
//  SerieDetailsView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import SwiftUI
import Kingfisher

struct SerieDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @StateObject var serieDetailsVM : SerieDetailsViewModel
  
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                ScrollViewReader { value in
                VStack(alignment: .leading){
                    ZStack(alignment: .topTrailing){
                        ZStack{
                            if let SerieImage = serieDetailsVM.selectedSerie.iconUrl, let SerieImageURL = URL(string:SerieImage){
                                KFImage(SerieImageURL)
                                    .placeholder {
                                        Image("placeholderSerie")
                                            .resizable()
                                            .scaledToFill()
                                    }
                                    .resizable()
                                    .scaledToFill()
                                
                                    .frame(width:geometry.size.width, height: 400,alignment: .top)
                                    .clipped()
                            }
                            Button{
                                serieDetailsVM.displayVideo = true
                                let value = UIInterfaceOrientation.landscapeRight.rawValue
                                UIDevice.current.setValue(value, forKey: "orientation")
                            } label:{
                                Image("play")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                        }
                        Button{
                            presentationMode.wrappedValue.dismiss()
                            
                        } label:{
                            Image("close")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .frame(width: 30, height: 30)
                                .background(Circle()
                                    .strokeBorder(Color.black,lineWidth: 0)
                                    .background(Circle().foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.6 ))))
                                .padding(.trailing,20)
                                .padding(.top,50)
                            
                            
                        }
                    }
                   
                    VStack(alignment:.leading,spacing:8){
                        HStack{
                            Text(serieDetailsVM.selectedSerie.name)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        
                        Text(serieDetailsVM.selectedSerie.description)
                        Text("Rating: \(serieDetailsVM.selectedSerie.rating5based ?? 0)/5")
                        Text("Genre: \(serieDetailsVM.selectedSerie.genre ?? "")")
                        Text("Cast: \(serieDetailsVM.selectedSerie.cast ?? "")")
                        
                        if let serieSeasons = serieDetailsVM.selectedSerie.seasons{
                            let sections = serieSeasons.map{$0.name}
                            SeasonView(sections:sections, selectedSection: $serieDetailsVM.selectedSection){
                                value.scrollTo(serieDetailsVM.selectedSection, anchor: .top)
                            }
                        }
                        
                        
                        ForEach (Array(serieDetailsVM.selectedSerie.seasons),id:\.name){season in
                            Text(season.name)
                            ForEach (season.episodes,id:\.id){ episode in
                                Button{
                                    self.serieDetailsVM.selectedEpisodeID = episode.id
                                    self.serieDetailsVM.displayVideo = true
                                }label:{
                                    EpisodeView(episodeID:episode.id,coverUrl:  episode.coverUrl, title: episode.title, description:  episode.description, displayVideo:$serieDetailsVM.displayVideo,selectedEpisodeID:$serieDetailsVM.selectedEpisodeID)
                                }
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal,8)
                    
                }
                }
            }
            .background(Color.black)
            .foregroundColor(Color.white)
            .ignoresSafeArea()
        }
        .sheet(isPresented: $serieDetailsVM.displayVideo,onDismiss: {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            //presentationMode.wrappedValue.dismiss()
        }) {
            VideoPlayerView(videoURL: "http://556677.ovh:25461/series/hn8rr4tp/opjmhaga/\(serieDetailsVM.selectedEpisodeID).mp4")
        }
        .onAppear(){
            serieDetailsVM.getSerieInfo()
        }
    }
}
