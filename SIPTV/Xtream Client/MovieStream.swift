//
//  VodStream.swift
//  SIPTV
//
//  Created by Dev on 25/08/2022.
//

import Foundation

//{"num":1,"name":"Altrimenti ci arrabbiamo (2022)","stream_type":"movie","stream_id":113936,"stream_icon":"http:\/\/556677.ovh:25461\/images\/movies\/yt40jRlEkpx34XbxlZqvotFRGzW.jpg","rating":"4.4","rating_5based":2.2,"added":"1661356957","category_id":"241","container_extension":"mp4","custom_sid":null,"direct_source":""}


struct MovieStream: Codable{
   
    var num: Int?
    var name: String?
    var streamType: String?
    var streamID: Int?
    var streamIcon: String?
//    var rating: Double?
    var rating5based : Double?
    var added: String?
    var categoryId: String?
    var containerExtension: String?
    var directSource: String?
    
    
    public enum CodingKeys: String, CodingKey{
        case num
        case name
        case streamType = "stream_type"
        case streamID = "stream_id"
        case streamIcon = "stream_icon"
//        case rating
        case rating5based = "rating_5based"
        case added
        case categoryId = "category_id"
        case containerExtension = "container_extension"
        case directSource = "direct_source"
    }
    
}


