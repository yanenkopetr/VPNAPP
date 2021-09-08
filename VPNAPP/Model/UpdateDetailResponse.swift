//
//  UpdateDetailResponse.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

class UpdateDetailResponse:Codable {
    var name : String
    var logo : String
    var version : String
    var update : String

    enum CodingKeys: String, CodingKey {
        case name
        case logo
        case version
        case update
    }
}
