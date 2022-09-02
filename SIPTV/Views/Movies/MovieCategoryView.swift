//
//  MovieCategoryView.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import SwiftUI
import Kingfisher

struct MovieCategoryView: View {
    
    @StateObject var category: MoviesCategory
    
    @Binding  var selectedCategory: MoviesCategory?
    @Binding  var selectedMovie: Movie?
    
    var body: some View {
        VStack{
            headerView
                .padding(.horizontal, 8)
            contentView
        }
    }
    
    var headerView: some View {
        HStack{
            Text(category.title)
                .font(.custom(RobotoFont.bold.rawValue, size: 18))
                .foregroundColor(Color.white)
            Spacer()
            Button{
                selectedCategory = category
            } label:{
                Text("Développer")
                    .font(.custom(RobotoFont.bold.rawValue, size: 14))
                    .foregroundColor(Color(red: 248/255, green: 10/255, blue: 10/255))
            }
        }
    }
    
    var contentView: some View{
        ScrollView(.horizontal){
            let gridItemLayout = [GridItem(.flexible())]
            LazyHGrid(rows:gridItemLayout){
                ForEach(category.movies,id:\.name){ movie in
                    Button{
                        DispatchQueue.main.async {
                            selectedMovie = movie
                        }
                    } label:{
                        MovieCell(movie:movie)
                            .frame(width: 100, height: 150)
                    }
                    .padding(.leading,8)
                }
            }
        }
    }
}

