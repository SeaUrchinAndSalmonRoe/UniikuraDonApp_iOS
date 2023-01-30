//
//  UserPhotoRepository.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/24.
//

import Foundation
import Moya

typealias CompletionHandler<T> = (Result<T, MoyaError>) -> Void

final class UserPhotoRepository: UserPhotoRepositoryProtocol {
    
    private let provider = MoyaProvider<UserPhotoApiService>(plugins :[NetworkLoggerPlugin()])
    
    // completionのアイテムをDomainObjectにする。
    func getPhotoListData(completion: @escaping CompletionHandler<[UserPhotoListData]>) {
        provider.request(.getPhotoList) {result in
            switch result {
            case let .success(response):
                completion(self.photoListDataToDomain(response: response))
            case let .failure(moyaError):
                completion(.failure(moyaError))
            }
        }
    }
    
    func photoListDataToDomain(response: Response) -> Result<[UserPhotoListData], MoyaError> {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try response.filterSuccessfulStatusAndRedirectCodes()
            let userPhotoListData = try response.map([UserPhotoListData].self, using: decoder)
            return .success(userPhotoListData)
        } catch let error {
            let moyaError = error as! MoyaError
            return .failure(moyaError)
        }
    }
    
    func getPhotoDetail(photoId: String, completion: @escaping CompletionHandler<UserPhotoDetailData>) {
        provider.request(.getPhotoById(id: photoId)) { result in
            switch result {
            case let .success(response):
                completion(self.photoDetailDataToDomain(response: response))
            case let .failure(moyaError):
                completion(.failure(moyaError))
            }
        }
    }
    
    func photoDetailDataToDomain(response: Response) -> Result<UserPhotoDetailData, MoyaError> {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try response.filterSuccessfulStatusAndRedirectCodes()
            let userPhotoDetailData = try response.map(UserPhotoDetailData.self, using: decoder)
            return .success(userPhotoDetailData)
        } catch let error {
            let moyaError = error as! MoyaError
            return .failure(moyaError)
        }
    }
    
}
