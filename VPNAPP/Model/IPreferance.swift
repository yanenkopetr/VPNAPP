//
//  IPreferance.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

struct IPreference {
    // get manufacture id from ios device
    static var uniqueId: String = UUID().uuidString
    // save and get account info from local data
    static var accountUser : AccountUser?
    // save and get server from local data
    static var server : ServerDetailResponse?
}
