//
//  UserPhotoDetailData.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/25.
//

import Foundation

struct UserPhotoDetailData: Decodable {
    let id : String?
    let urls: Urls?
    let description: String?
    let exif: Exif?
    let createdAt: String?
}

struct Exif: Decodable {
    let name: String?
}
