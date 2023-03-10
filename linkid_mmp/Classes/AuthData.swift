//
//  AuthData.swift
//  linkid_mmp
//
//  Created by Tuan Dinh on 31/01/2023.
//

import Foundation

struct AuthData: Decodable {
    let responseCode: Int
    let responseText: String
    let data: SessionData
}

struct SessionData: Decodable {
    let sessionId: String
    let token: String
    let sessionExpireTimeInSeconds: Int64
}
