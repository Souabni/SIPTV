//
//  XtreamLoginView.swift
//  XtreamIPTV
//
//  Created by Souabni Issam on 24/09/2022.
//

import SwiftUI

struct XtreamLoginView: View {
    @EnvironmentObject var appState : AppState
    
    @State private var name: String = ""
    @State private var url: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var displayAddProfilErrorView = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    Image("LaunchscreenImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Spacer()
                }
                HStack{
                    TextField("", text: $name)
                        .placeholder("Nom de la playlist", when: name.isEmpty)
                }
                .font(.custom(RobotoFont.regular.rawValue, size: 16))
                .foregroundColor(Color.white)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(6)
                .padding(.horizontal,16)
                
                VStack{
                    
                    HStack{
                        TextField("", text: $url)
                            .placeholder("Domaine", when: url.isEmpty)
                    }
                    Divider()
                    HStack{
                        TextField("", text: $username)
                            .placeholder("username", when: username.isEmpty)
                    }
                    Divider()
                    HStack{
                        TextField("", text: $password)
                            .placeholder("Password", when: password.isEmpty)
                    }
                }
                .font(.custom(RobotoFont.regular.rawValue, size: 16))
                .foregroundColor(Color.white)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(6)
                .padding(.horizontal,16)
                
                Button{
                    
                    let xtreamProfil = Profil(title: name,
                                              link: url,
                                              userName: username,
                                              password: password)
                    XtreamAgent(profil: xtreamProfil).authenticate { authentication in
                        guard let authentication = authentication else{
                            displayAddProfilErrorView = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            self.displayAddProfilErrorView = false
                                        }
                            return
                        }
                        if authentication.userInfo?.auth == 1{
                            XtreamManager.shared.add(profil:xtreamProfil)
                            appState.navigationSection = .mainView
                        }else{
                            displayAddProfilErrorView = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            self.displayAddProfilErrorView = false
                                        }
                        }
                    }
                    
                } label:{
                    HStack{
                        Spacer()
                        Text("Add Xtream profile")
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
                .disabled(name.isEmpty || url.isEmpty || username.isEmpty || password.isEmpty  )
                .opacity(name.isEmpty || url.isEmpty || username.isEmpty || password.isEmpty ? 0.5 : 1)
                Spacer()
            }
            .padding(.vertical,40)
            .background(Color.black)
            if displayAddProfilErrorView{
                Text("error info")
                    .padding(40)
                    .background(Color.red)
                    .cornerRadius(6)
                    .padding(.bottom, 40)
                    .padding(.horizontal, 16)
            }
        }
        .ignoresSafeArea()
    }
}

extension View {
    func placeholder<Content: View>(
           when shouldShow: Bool,
           alignment: Alignment = .leading,
           @ViewBuilder placeholder: () -> Content) -> some View {

           ZStack(alignment: alignment) {
               placeholder().opacity(shouldShow ? 1 : 0)
               self
           }
       }
    
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading) -> some View {
            
        placeholder(when: shouldShow, alignment: alignment) { Text(text).foregroundColor(.gray) }
    }
}
