//
//  AccountResponse.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

struct AccountResponse: Codable {
    let resellerName: String?
    let subscriptionDetails: [SubscriptionDetail]?
    let topUpLink: String?
    let success, error: Int?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case resellerName = "reseller_name"
        case subscriptionDetails = "subscription_details"
        case topUpLink = "top_up_link"
        case success, error, message
    }
}

// MARK: - SubscriptionDetail
struct SubscriptionDetail: Codable {
    let subscriptionName, status, expiry: String?

    enum CodingKeys: String, CodingKey {
        case subscriptionName = "subscription_name"
        case status, expiry
    }
}
