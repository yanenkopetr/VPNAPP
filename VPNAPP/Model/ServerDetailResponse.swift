//
//  ServerDetailResponse.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

class ServerDetailResponse:Codable {
    var server : String?
    var error : Int? = 1
    var message : String? = "Unknown error, please contact support"
    
    enum CodingKeys: String, CodingKey {
        case server = "server_details"
        case error = "server_name"
        case message = "server_location"
    }
}
