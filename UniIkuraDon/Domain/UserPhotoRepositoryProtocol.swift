//
//  UserPhotoRepositoryProtocol.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/26.
//

import Foundation

protocol UserPhotoRepositoryProtocol {
    func getPhotoListData(completion: @escaping CompletionHandler<[UserPhotoListData]>)
    func getPhotoDetail(photoId: String, completion: @escaping CompletionHandler<UserPhotoDetailData>)
}
