//
//  ApiClient.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import Alamofire

final class ApiClient {
    @discardableResult
    static func request<Model: Decodable>(_ route: ApiRouter, decoder: JSONDecoder = JSONDecoder(),
                                          completion: @escaping (Result<Model, Error>) -> Void) -> DataRequest {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970

        return AF.request(route).validate().responseDecodable(of: Model.self, decoder: decoder) { response in
            switch response.result {
            case let .success(model):
                completion(.success(model))
            case let .failure(error):
                let serverError = decodeServerError(data: response.data)
                let error = serverError?.localizedDescription?.asError() ?? error.parse()
                completion(.failure(error))
            }
        }
    }

    @discardableResult
    static func request(_ route: ApiRouter, completion: ((Error?) -> Void)? = nil) -> DataRequest {
        return AF.request(route).validate().response { response in
            switch response.result {
            case .success:
                completion?(nil)
            case let .failure(error):
                let serverError = decodeServerError(data: response.data)
                let error = serverError?.localizedDescription?.asError() ?? error.parse()
                completion?(error)
            }
        }
    }

    static func request<Model: Decodable>(_ route: ApiRouter, decoder: JSONDecoder = JSONDecoder(), params: [MultipartData], completion: @escaping (Result<Model, Error>) -> Void) {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970

        AF.upload(multipartFormData: { multipart in
            for param in params {
                if let file = param.file {
                    multipart.append(param.data, withName: param.name, fileName: file.fileName, mimeType: file.mimeType)
                } else {
                    multipart.append(param.data, withName: param.name)
                }
            }
        }, with: route).validate().responseDecodable(of: Model.self, decoder: decoder) { response in
            switch response.result {
            case let .success(model):
                completion(.success(model))
            case let .failure(error):
                let serverError = decodeServerError(data: response.data)
                let error = serverError?.localizedDescription?.asError() ?? error.parse()
                completion(.failure(error))
            }
        }
    }

    static func request(_ route: ApiRouter, params: [MultipartData], completion: @escaping (AFError?) -> Void) {
        AF.upload(multipartFormData: { multipart in
            for param in params {
                if let file = param.file {
                    multipart.append(param.data, withName: param.name, fileName: file.fileName, mimeType: file.mimeType)
                } else {
                    multipart.append(param.data, withName: param.name)
                }
            }
        }, with: route).validate().response { response in
            completion(response.error)
        }
    }

    static func decodeServerError(data: Data?) -> ServerErrorMessage? {
        guard let data = data else { return nil }
        guard let messages = try? JSONDecoder().decode([ServerErrorMessage].self, from: data) else { return nil }
        return messages.first
    }
}

struct ServerErrorMessage: Decodable {
    let message: String?

    var localizedDescription: String? {
        return message
    }
}

extension String {
    func asError() -> Error {
        NSError(domain: "ServerError", code: 100, userInfo: [NSLocalizedDescriptionKey: self])
    }
}

extension AFError {
    func parse() -> Error {
        guard let message = self.localizedDescription.split(separator: ":").last.flatMap(String.init)?.trim() else {
            return self.localizedDescription.asError()
        }
        return message.asError()
    }
}

struct MultipartData {
    struct File {
        let fileName: String
        let mimeType: String

        init(fileName: String, mimeType: String = "image/jpeg") {
            self.fileName = fileName
            self.mimeType = mimeType
        }
    }

    let name: String
    let data: Data
    let file: File?
}
