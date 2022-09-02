//
//  SerieCategoryView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//


import SwiftUI
import Kingfisher

struct SerieCategoryView: View {
    
    @StateObject var category: SeriesCategory
    
    @Binding  var selectedCategory: SeriesCategory?
    @Binding  var selectedSerie: Serie?
    
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
                ForEach(category.series,id:\.name){ serie in
                    Button{
                        DispatchQueue.main.async {
                            selectedSerie = serie
                        }
                    } label:{
                        SerieCell(serie:serie)
                            .frame(width: 100, height: 150)
                            .clipped()
                    }
                    .padding(.leading,8)
                }
            }
        }
    }
}

