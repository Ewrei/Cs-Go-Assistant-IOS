//
//  ApiRouter.swift
//  CsGo Test
//
//  Created by Виталий on 10/24/20.
//  Copyright © 2020 Виталий. All rights reserved.
//

import Foundation
import Alamofire

struct RequestConfig {
    let path: String
    let method: HTTPMethod
    var params: Parameters?
    let encoding: ParameterEncoding
}

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

enum ApiRouter: URLRequestConvertible {
    fileprivate var headers: HTTPHeaders? {
        return Preferences.shared.sessionId.flatMap { HTTPHeaders(["Cookie": "sessionid=" + $0]) }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try AppConfig.steamCommunityUrl.asURL()
        let request = try URLRequest(url: url.appendingPathComponent(config.path), method: config.method, headers: headers)
        return try config.encoding.encode(request, with: config.params)
    }
    
    // MARK: - Endpoints
    case getSearchUser(text: String, sessionid: String, filter: String, steamid_user: String, page: Int)
    
    var config: RequestConfig {
        switch self {
        // MARK: .getSearchUser
        case let .getSearchUser(text, sessionid, filter, steamid_user, page):
            return RequestConfig(
                path: "/search/SearchCommunityAjax",
                method: .get,
                params: ["text": text,
                          "sessionid": sessionid,
                          "filter": filter,
                          "steamid_user": steamid_user,
                          "page": page],
                encoding: JSONEncoding.default
            )
        }
    }
}
