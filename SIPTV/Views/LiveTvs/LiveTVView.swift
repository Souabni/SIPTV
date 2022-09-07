//
//  LiveTVView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI

struct LiveTVView: View {
    @EnvironmentObject var currentSession : XtreamSession
    @StateObject var LiveTVVM : LiveTVViewModel =  LiveTVViewModel()
    
    var body: some View {
        
        if  let firstCategory = currentSession.liveTVsCategories.last{
            ScrollView{
                VStack{
                    let gridItemLayout = [GridItem(.flexible(minimum: 150)),
                                          GridItem(.flexible(minimum: 150))]
                    LazyVGrid(columns:gridItemLayout, spacing: 30){
                        ForEach(firstCategory.tvs,id:\.num){tv in
                            Button{
                                LiveTVVM.selectedTV = tv
                                LiveTVVM.displayTV = true
                            } label:{
                                tvView(name: tv.name)
                            }
                           
                        }
                    }
                    Spacer()
                }
            }
            .foregroundColor(Color.white)
            .background(Color.black)
            .sheet(isPresented: $LiveTVVM.displayTV ,onDismiss: {
                let value = UIInterfaceOrientation.portrait.rawValue
                UIDevice.current.setValue(value, forKey: "orientation")
                //presentationMode.wrappedValue.dismiss()
            }) {
                LiveVideoPlayerView(videoURL: "http://556677.ovh:25461/hn8rr4tp/opjmhaga/9416")
            }
        }else{
            Text("no tvs")
                .foregroundColor(Color.white)
        }
    }
}
