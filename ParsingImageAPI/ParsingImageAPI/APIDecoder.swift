//
//  APIDecoder.swift
//  ParsingImageAPI
//
//  Created by Xotech on 10/02/2024.
//



struct APIDecoder : Decodable {
    let CrossPromotions : [Item]
}

struct Item : Decodable {
    let id : Int
    let title : String
    let image_url : String
}
