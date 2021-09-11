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
    private let SECRET_KEY = "jjnj378jklnsdf92334n"
    
    static var shared = APIClient()

    lazy var requestObservable = RequestObservable(config: .default)
        
    func getAccountInfo() -> Observable<AccountResponse> {
                
        let account = IPreference.accountUser
        var strUrl = API_URL + "api/v1/api.php?"
        
        strUrl += "secret_key=\(SECRET_KEY)"
        strUrl += "&action=check_login"
        strUrl += "&pin=\(account?.pin ?? "")"
        strUrl += "&password=\(account?.pass ?? "")"
        strUrl += "&unique_id=\(IPreference.uniqueId)"

        let url = URL(string: strUrl)
        
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)

        request.httpMethod = "GET"
        
        return requestObservable.callAPI(request: request)
    }
    
    func getUpdateInfo() -> Observable<UpdateResponse> {
                
        var strUrl = API_URL + "api/v1/api.php?"
        
        strUrl += "secret_key=\(SECRET_KEY)&"
        strUrl += "action=get_update&"
        strUrl += "&unique_id=\(IPreference.uniqueId)"

        let url = URL(string: strUrl)
        
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)

        request.httpMethod = "GET"
        
        return requestObservable.callAPI(request: request)
    }
    
    func getListServer() -> Observable<[ServerResponse]> {
        let account = IPreference.accountUser
        var strUrl = API_URL + "api/v1/api.php?"
        
        strUrl += "secret_key=\(SECRET_KEY)&"
        strUrl += "action=get_server_list&"
        strUrl += "pin=\(account?.pin ?? "")"
        strUrl += "&password=\(account?.pass ?? "")"
        strUrl += "&unique_id=\(IPreference.uniqueId)"

        let url = URL(string: strUrl)
        
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)

        request.httpMethod = "GET"
        
        return requestObservable.callAPI(request: request)
    }
    
    func sendEmail(text: String) -> Observable<Any> {
        let account = IPreference.accountUser
        var strUrl = API_URL + "api/v1/api.php?"
        
        strUrl += "secret_key=\(SECRET_KEY)&"
        strUrl += "action=send_email&"
        strUrl += "pin=\(account?.pin ?? "")"
        strUrl += "$message=\(text)"
        strUrl += "&password=\(account?.pass ?? "")"
        strUrl += "&unique_id=\(IPreference.uniqueId)"

        let url = URL(string: strUrl)
        
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)

        request.httpMethod = "POST"
        
        return requestObservable.call(request: request)
    }
    
    func getServerDetail(id: Double) -> Observable<ServerDetailResponse> {
        let account = IPreference.accountUser
        var strUrl = API_URL + "api/v1/api.php?"
        
        strUrl += "secret_key=\(SECRET_KEY)&"
        strUrl += "action=get_single_server_details&"
        strUrl += "pin=\(account?.pin ?? "")"
        strUrl += "&password=\(account?.pass ?? "")"
        strUrl += "&server_id=\(id)"
        strUrl += "&unique_id=\(IPreference.uniqueId)"

        let url = URL(string: strUrl)
        
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)

        request.httpMethod = "GET"
        
        return requestObservable.callAPI(request: request)
    }
    
    func sendRating(rating: Int) -> Observable<Any> {
        let account = IPreference.accountUser
        var strUrl = API_URL + "api/v1/api.php?"
        
        strUrl += "secret_key=\(SECRET_KEY)&"
        strUrl += "action=rate_server&"
        strUrl += "pin=\(account?.pin ?? "")"
        strUrl += "&password=\(account?.pass ?? "")"
        strUrl += "&rating=\(rating)"
        strUrl += "&unique_id=\(IPreference.uniqueId)"

        let url = URL(string: strUrl)
        
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)

        request.httpMethod = "POST"
        
        return requestObservable.call(request: request)
    }
}
