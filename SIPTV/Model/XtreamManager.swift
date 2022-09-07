//
//  XtreamManager.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

class XtreamManager: ObservableObject{
    public static let sharedInstance = XtreamManager()
    static let shared  = XtreamManager()
    
    private init() {
        // L'initialisation est privé pour être sur qu'une seule instance sera créé
    }
    
    var profils : [Profil] = [Profil(title: "orca",
                                     link: "http://556677.ovh:25461",
                                     userName: "hn8rr4tp",
                                     password: "opjmhaga"),
                              Profil(title: "OTT",
                                     link: "http://ott-pro.tn:5475",
                                     userName: "AZ142665789353",
                                     password: "AZ142665789353")
                              //                              ,
                              //                              Profil(title: "orca2",
                              //                                                                               link: "http://556677.ovh:25461",
                              //                                                                               userName: "hn8rr4tp",
                              //                                                                               password: "opjmhaga"),
                              //                                                        Profil(title: "OTT2",
                              //                                                                                                         link: "http://ott-pro.tn:5475",
                              //                                                                                                         userName: "AZ142665789353",
                              //                                                                                                         password: "AZ142665789353"),
                              //                              Profil(title: "orca3",
                              //                                                                               link: "http://556677.ovh:25461",
                              //                                                                               userName: "hn8rr4tp",
                              //                                                                               password: "opjmhaga"),
                              //                                                        Profil(title: "OTT3",
                              //                                                                                                         link: "http://ott-pro.tn:5475",
                              //                                                                                                         userName: "AZ142665789353",
                              //                                                                                                         password: "AZ142665789353"),
                              //                              Profil(title: "orca4",
                              //                                                                               link: "http://556677.ovh:25461",
                              //                                                                               userName: "hn8rr4tp",
                              //                                                                               password: "opjmhaga"),
                              //                                                        Profil(title: "OTT4",
                              //                                                                                                         link: "http://ott-pro.tn:5475",
                              //                                                                                                         userName: "AZ142665789353",
                              //                                                                                                         password: "AZ142665789353")
    ]
    
    
    
    @Published var currentSession = XtreamSession(profil:     Profil(title: "OTT",
                                                                     link: "http://ott-pro.tn:5475",
                                                                     userName: "AZ142665789353",
                                                                     password: "AZ142665789353"))
    
}
