//
//  UpdateResponse.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

// MARK: - UpdateResponse
struct UpdateResponse: Codable {
    let updateDetails: [UpdateDetail]?
    let updateAndRestartLink: String?
    let offlineLink: String?
    let success, error: Int?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case updateDetails = "update_details"
        case updateAndRestartLink = "update_and_restart_link"
        case offlineLink = "offline_link"
        case success, error, message
    }
}

// MARK: - UpdateDetail
struct UpdateDetail: Codable {
    let logo, name, version, update: String?
}
