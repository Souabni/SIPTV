//
//  EpisodeView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import SwiftUI
import Kingfisher

struct EpisodeView: View {
    var episodeID : String
    var coverUrl : String
    var title : String
    var description : String
    
    @Binding var displayVideo : Bool
    @Binding var selectedEpisodeID : String
    
    var body: some View {
        VStack{
            
            HStack{
                Button{
//                    selectedEpisodeID = episodeID
//                    displayVideo = true
                }label:{
                    ZStack{
                        if let iconURL = URL(string:coverUrl){
                            
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
                
           
            Text(title)
            Spacer()
            }
            
            Text(description)
        }
    }
}

