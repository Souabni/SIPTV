//
//  tvView.swift
//  SIPTV
//
//  Created by Souabni Issam on 04/09/2022.
//

import SwiftUI

struct tvView: View {
    var name : String
   
    var body: some View {
        VStack{
       Rectangle()
            .background(Color.gray)
            .frame(width: 200, height: 150)
        
        Text(name)
        }
    }
}

