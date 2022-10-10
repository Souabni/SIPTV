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
    
    var profils : [Profil] = [
//        Profil(title: "orca",
//                                     link: "http://556677.ovh:25461",
//                                     userName: "hn8rr4tp",
//                                     password: "opjmhaga"),
//                              Profil(title: "OTT",
//                                     link: "http://ott-pro.tn:5475",
//                                     userName: "AZ142665789353",
//                                     password: "AZ142665789353")
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
    
    
    
    @Published var currentSession = XtreamSession(profil: Profil()
//                                                    Profil(title: "orca",
//                                                                     link: "http://556677.ovh:25461",
//                                                                     userName: "hn8rr4tp",
//                                                                     password: "opjmhaga")
    )
    
    private init() {
        do {
            if let storedObjItem = UserDefaults.standard.object(forKey: "profils"){
                let storedItems = try JSONDecoder().decode([Profil].self, from: storedObjItem as! Data)
                profils = storedItems
            }
        } catch let err {
            print(err)
        }
    }
    
    
    func add(profil: Profil){
        profils.append(profil)
        currentSession.set(profil: profil)
        
        //Storing Items
        if let encoded = try? JSONEncoder().encode(profils) {
            UserDefaults.standard.set(encoded, forKey: "profils")
        }
    }
    
    func delete(profil: Profil){
        profils.removeAll { $0.title == profil.title }
        //Storing Items
        if let encoded = try? JSONEncoder().encode(profils) {
            UserDefaults.standard.set(encoded, forKey: "profils")
        }
    }
}  
