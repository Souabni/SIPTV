//
//  XtreamManager.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

class XtreamManager: ObservableObject{
   static var shared = XtreamManager()
    
    var profils : [Profil] = [Profil(title: "orca",
                                                     link: "http://556677.ovh:25461",
                                                     userName: "hn8rr4tp",
                                                     password: "opjmhaga")]
    
   
    
    @Published var currentSession = XtreamSession(profil:  Profil(title: "orca",
                                                       link: "http://556677.ovh:25461",
                                                       userName: "hn8rr4tp",
                                                       password: "opjmhaga"))
    
}
