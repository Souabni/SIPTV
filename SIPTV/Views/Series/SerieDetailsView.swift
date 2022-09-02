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
   
    @ObservedObject var serieDetailsVM : SerieDetailsViewModel
    @State var selectedSection : String = "Saison 1"
    
    @State var displayVideo : Bool = false
    @State var selectedEpisodeID : String = ""
    
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                ScrollViewReader { value in
                VStack(alignment: .leading){
                    ZStack(alignment: .topTrailing){
                        ZStack{
                            if let SerieImage = selectedSerie.iconUrl, let SerieImageURL = URL(string:SerieImage){
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
                                displayVideo = true
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
                            Text(selectedSerie.name)
                                .foregroundColor(Color.white)
                            
                            Spacer()
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        
                        Text(selectedSerie.info?.info?.plot ?? "plot")
                        Text("Rating: \(selectedSerie.info?.info?.rating5based ?? 0)/5")
                        Text("Genre: \(selectedSerie.info?.info?.genre ?? "")")
                        Text("Cast: \(selectedSerie.info?.info?.cast ?? "")")
                        if let serieSeasons = selectedSerie.info?.seasons{
                            let sections = serieSeasons.map{$0.name ?? ""}
                            SeasonView(sections:sections, selectedSection: $selectedSection){
                                value.scrollTo(selectedSection, anchor: .top)
                            }
                        }
                        
                        
                        ForEach (Array(selectedSerie.episodes.enumerated()),id:\.offset){ index, seasonEpisodes in
                            if let seasons = selectedSerie.info?.seasons{
                               Text(seasons[index].name ?? "")
                                    .id(seasons[index].name ?? "")
                            }
                            
                            ForEach (seasonEpisodes,id:\.id){ episode in
                                Button{
                                    selectedEpisodeID = episode.id ?? ""
                                    displayVideo = true
                                }label:{
                                EpisodeView(episodeID:episode.id ?? "",coverUrl:  "", title: episode.title ?? "", description: episode.info?.plot ?? "",displayVideo:$displayVideo,selectedEpisodeID:$selectedEpisodeID)
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
        .sheet(isPresented: $displayVideo,onDismiss: {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            //presentationMode.wrappedValue.dismiss()
        }) {
            VideoPlayerView(videoURL: "http://556677.ovh:25461/series/hn8rr4tp/opjmhaga/\(selectedEpisodeID).mp4")
        }
    }
}
