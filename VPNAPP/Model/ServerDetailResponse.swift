//
//  ServerDetailResponse.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

// MARK: - ServerDetailResponse
struct ServerDetailResponse: Codable {
    let serverDetails: ServerDetails?
    let subscriptionDetails: [SubscriptionServerDetail]?
    let resellerName: String?
    let topUpLink: String?
    let success, error: Int?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case serverDetails = "server_details"
        case subscriptionDetails = "subscription_details"
        case resellerName = "reseller_name"
        case topUpLink = "top_up_link"
        case success, error, message
    }
}

// MARK: - ServerDetails
struct ServerDetails: Codable {
    let serverID: Int?
    let logo, serverName, serverLocation, serverURL: String?
    let username, password: String?

    enum CodingKeys: String, CodingKey {
        case serverID = "server_id"
        case logo
        case serverName = "server_name"
        case serverLocation = "server_location"
        case serverURL = "server_url"
        case username, password
    }
}

// MARK: - SubscriptionDetail
struct SubscriptionServerDetail: Codable {
    let subscriptionName, status, expiry: String?

    enum CodingKeys: String, CodingKey {
        case subscriptionName = "subscription_name"
        case status, expiry
    }
}
