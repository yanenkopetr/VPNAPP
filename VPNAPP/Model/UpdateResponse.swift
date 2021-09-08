//
//  UpdateResponse.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

class UpdateResponse:Codable {
    var listUpdate : UpdateDetailResponse
    var linkUpdate : String
    var linkOffline : String

    enum CodingKeys: String, CodingKey {
        case listUpdate = "update_details"
        case linkUpdate = "update_and_restart_link"
        case linkOffline = "offline_link"
    }
}
