//
//  ApiModel.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//

import Foundation
import RxCocoa
import RxSwift

class APIClient {
    
    private let API_URL = "https://jailbreakvpn.com/"
    
    static var shared = APIClient()
    
    lazy var requestObservable = RequestObservable(config: .default)
        
    func getAccountInfo() -> Observable<AccountResponse> {
        
        let account = IPreference.accountUser
        
        var strUrl = API_URL + "api/v1/api.php?"
        
        strUrl += "secret_key=jjnj378jklnsdf92334n&"
        strUrl += "action=check_login&"
        strUrl += "pin=\(account?.pin ?? "")"
        strUrl += "&password=\(account?.pass ?? "")"
        strUrl += "&unique_id=\(IPreference.uniqueId)"

        let url = URL(string: strUrl)
        
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)

        request.httpMethod = "GET"
        
        return requestObservable.callAPI(request: request)
    }
}
