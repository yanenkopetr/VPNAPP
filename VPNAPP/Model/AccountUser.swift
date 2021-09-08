//
//  AccountUser.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation

class AccountUser {
    var pin : String
    var pass : String
    var expireDate : String
    var sellerName : String
    
    init(_pin:String, _pass:String, _expireDate:String, _sellerName:String) {
        self.pin = _pin
        self.pass = _pass
        self.expireDate = _expireDate
        self.sellerName = _sellerName
    }
}
