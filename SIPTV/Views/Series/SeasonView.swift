//
//  SeasonView.swift
//  SIPTV
//
//  Created by Souabni Issam on 01/09/2022.
//

import SwiftUI

struct SeasonView: View {
    
    var sections : [String]
    @Binding var selectedSection : String
   
    
    var body: some View {
        ScrollView(.horizontal){
            let gridItemLayout = [GridItem(.flexible())]
            LazyHGrid(rows:gridItemLayout){
                HStack(spacing:20){
                    ForEach(sections,id:\.self){section in
                        Button{
                            selectedSection = section
                         
                        }label:{
                            VStack(spacing:4){
                                Text(section)
                                    .font(.custom(RobotoFont.bold.rawValue, size: 14))
                                Rectangle()
                                    .strokeBorder(Color.red,lineWidth: 0)
                                    .background(selectedSection == section ? Color.red: Color.clear)
                                    .frame(height: 5)
                                
                            }
                           
                        }
                    }
                }
            }
        }
    }
}
