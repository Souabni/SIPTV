//
//  XtreamLoginView.swift
//  SIPTV
//
//  Created by Souabni Issam on 05/09/2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView{
           
                VStack{
                    HStack{
                        Image("LaunchscreenImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        Spacer()
                    }
                    Image("gallery")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    NavigationLink{
                        XtreamLoginView()
                            .ignoresSafeArea()
                            .navigationBarHidden(true)
                    } label:{
                        HStack{
                            Spacer()
                            Text("Xtream")
                                .font(.custom(RobotoFont.bold.rawValue, size: 18))
                                .foregroundColor(Color.white)
                                .padding(.horizontal,16)
                            Spacer()
                        }
                        .frame(height:50)
                        .background(Color.red)
                        .cornerRadius(6)
                        .padding(.horizontal,16)
                    }
                }
                .padding(.vertical,40)
                .background(Color.black)
                .ignoresSafeArea()
        }
        
    }
}
