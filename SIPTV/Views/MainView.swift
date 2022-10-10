//
//  MainView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI

struct MainView: View {
    @State var selectedSection : Section = .movies
    var body: some View {
        GeometryReader { geometry in
        NavigationView{
            ZStack(alignment: .bottom ){
                
                switch selectedSection {
                case .movies:
                    MoviesView()
                case .series:
                    SeriesView()
                case .liveTV:
                    LiveTVView()
                }
                
                SectionsBarView(section: $selectedSection)
                    .frame(width:geometry.size.width*4/5, height:84)
                    .padding(.bottom,30)
                   
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        }
        .enableLightStatusBar()
        
    }
}
