//
//  UserPhotoListDto.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/24.
//

import Foundation

struct UserPhotoListData: Decodable, Identifiable {
    let id : String?
    let urls: Urls?
    let description: String?
}

struct Urls: Decodable {
    let raw: String?
}
