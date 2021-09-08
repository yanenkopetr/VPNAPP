//
//  ServerResponce.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

class ServerResponse:Codable {
    var id : Double
    var logo : String?
    var name : String
    var location : String
    
    enum CodingKeys: String, CodingKey {
        case id = "server_id"
        case logo
        case name = "server_name"
        case location = "server_location"
    }
}
