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
        NavigationView{
            ZStack(alignment: .top ){
                
                switch selectedSection {
                case .movies:
                    MoviesView()
                case .series:
                    SeriesView()
                case .liveTV:
                    LiveTVView()
                }
                
                SectionsBarView(section: $selectedSection)
                    .frame(height:84)
                   .background(Color.black)
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        .enableLightStatusBar()
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
