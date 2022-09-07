//
//  MovieDetailsView.swift
//  SIPTV
//
//  Created by Dev on 28/08/2022.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var currentXtreamSession : XtreamSession
    
    @ObservedObject var selectedMovie : Movie
    @State var displayVideo : Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .topTrailing){
                ZStack{
                    if let movieImage = selectedMovie.iconUrl, let movieImageURL = URL(string:movieImage){
                        KFImage(movieImageURL)
                            .placeholder {
                                Image("placeholderMovie")
                                    .resizable()
                                    .scaledToFill()
                            }
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth:.infinity)
                            .frame(height: 400,alignment: .top)
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
            HStack{
                Text(selectedMovie.name )
                    .foregroundColor(Color.white)
                Text(selectedMovie.info?.info?.age ?? "")
                Spacer()
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            HStack{
                Text(selectedMovie.info?.info?.releaseDate ?? "")
                if let durationSecs = selectedMovie.info?.info?.durationSecs as? Int?, let duration = durationSecs{
                    
                    Text("\(duration/60)'")
                }
                if let durationSecs = selectedMovie.info?.info?.durationSecs as? String?{
                    
                    Text("\(durationSecs ?? "")ff")
                }
                
                
            }
            Text(selectedMovie.info?.info?.description ?? "")
            Text("cast : \(selectedMovie.info?.info?.cast ?? "")")
            Text("genre : \(selectedMovie.info?.info?.genre ?? "")")
            Spacer()
        }
        .background(Color.black)
        .foregroundColor(Color.white)
        .ignoresSafeArea()
        .onAppear{
            currentXtreamSession.xtreamAgent.getVodInfo(vodID: selectedMovie.movieID) { vodInfo in
                DispatchQueue.main.async {
                    print(vodInfo)
                    selectedMovie.info = vodInfo
                }
            }
        }
        .sheet(isPresented: $displayVideo,onDismiss: {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            //presentationMode.wrappedValue.dismiss()
        }) {
            VideoPlayerView(videoURL: selectedMovie.url)
        }
    }
}
