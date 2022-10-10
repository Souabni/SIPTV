//
//  ProfilsView.swift
//  SIPTV
//
//  Created by Souabni Issam on 05/09/2022.
//

import SwiftUI

struct ProfilsView: View {
    @EnvironmentObject var appState : AppState
    
    @Binding var navigationSection : AppState.NavigationSection
    @ObservedObject var xtreamManager : XtreamManager
    
    @State private var scrollViewContentSize: CGSize = .zero
    @State private var displayXtreamLoginView = false
    
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            VStack(alignment: .center, spacing:16 ){
                Spacer()
                ScrollView{
                    let gridItemLayout = [GridItem(.flexible(minimum: 150)),
                                          GridItem(.flexible(minimum: 150))]
                    LazyVGrid(columns:gridItemLayout, spacing: 30){
                        ForEach(xtreamManager.profils,id:\.title){ profil in
                            Button{
                                if xtreamManager.currentSession.profil.title != profil.title{
                                    xtreamManager.currentSession.set(profil: profil)
                                }
                                navigationSection = .mainView
                            }label:{
                                ProfilCell(profil: profil)
                                    .frame(width: 150,height: 200)
//                                    .gesture(LongPressGesture(minimumDuration: 0.5)
//                                           .onEnded { _ in
//                                               xtreamManager.delete(profil: profil)
//                                           })
                            }
                        }
                    }
                    .background(
                        GeometryReader { geo -> Color in
                            DispatchQueue.main.async {
                                scrollViewContentSize = geo.size
                            }
                            return Color.clear
                        }
                    )
                }
                .frame(maxWidth: .infinity, maxHeight: scrollViewContentSize.height)
                Spacer()
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity
            )
            .background(Color.black)
            .fullScreenCover(isPresented: $displayXtreamLoginView) {
                ZStack(alignment:.topTrailing){
                    XtreamLoginView()
                    Button{
                        displayXtreamLoginView = false
                    } label:{
                        Image("close")
                            .resizable()
                            .scaledToFit()
                            .frame(width:16, height:16)
                            .padding(10)
                            .foregroundColor(Color.black)
                            .background(Color.red)
                            .cornerRadius(.infinity)
                            .padding(20)
                    }
                }
               
            }
            
            Button{
                displayXtreamLoginView = true
            } label:{
                Image("add")
                    .resizable()
                    .scaledToFit()
                    .frame(width:40, height:40)
                    .foregroundColor(Color.red)
                    .padding(40)
            }
            
        }
        .ignoresSafeArea()
        .enableLightStatusBar()
    }
}

