//
//  ProfilsView.swift
//  SIPTV
//
//  Created by Souabni Issam on 05/09/2022.
//

import SwiftUI

struct ProfilsView: View {
    
    @Binding var navigationSection : AppState.NavigationSection
    @ObservedObject var xtreamManager : XtreamManager
    
    @State private var scrollViewContentSize: CGSize = .zero
    
    
    var body: some View {
        
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
        .ignoresSafeArea()
        .enableLightStatusBar()
    }
}

