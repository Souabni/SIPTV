//
//  EpisodeView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import SwiftUI
import Kingfisher

struct EpisodeView: View {
    var episode : Episode
    
    @Binding var displayVideo : Bool
    @Binding var selectedEpisode : Episode?
    
    var body: some View {
        VStack{
            
            HStack{
                Button{
                    selectedEpisode = episode
                    displayVideo = true
                }label:{
                    ZStack{
                        if let iconURL = URL(string:episode.coverUrl){
                            
                            KFImage(iconURL)
                                .placeholder {
                                    Color.gray
                                }
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 100)
                                .clipped()
                            
                        }
                        else{
                            Color.gray
                                .frame(width: 150, height: 100)
                        }
                        
                        Image("play")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                
           
                Text(episode.title)
            Spacer()
            }
            
            Text(episode.description)
        }
    }
}

