//
//  ProfilCell.swift
//  SIPTV
//
//  Created by Souabni Issam on 05/09/2022.
//

import SwiftUI

struct ProfilCell: View {
    var profil : Profil
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Image("avatar")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .background(Color.gray)
                    .cornerRadius(5)
                
                Text(profil.title)
            }
            .foregroundColor(Color.white)
        }
    }
}
