//
//  Request.swift
//  VPNAPP
//
//  Created by Petr Yanenko on 08.09.2021.
//
import Foundation
import RxSwift
import RxCocoa

public class RequestObservable {
    private lazy var jsonDecoder = JSONDecoder()
    private var urlSession: URLSession
    public init(config:URLSessionConfiguration) {
        urlSession = URLSession(configuration:
                                    URLSessionConfiguration.default)
    }

    public func callAPI<ItemModel: Decodable>(request: URLRequest)
    -> Observable<ItemModel> {
        
        return Observable.create { observer in

            let task = self.urlSession.dataTask(with: request) { (data,
                                                                  response, error) in
                if let httpResponse = response as? HTTPURLResponse{
                    let statusCode = httpResponse.statusCode
                    do {
                        let _data = data ?? Data()
                        
                        let dataStr = String(data: _data, encoding: .utf8)!
                        print(dataStr)
                        
                        if ItemModel.self is String.Type {
                            observer.onNext(dataStr as! AnyObserver<ItemModel>.Element)
                        }
                        else {
                            let objs = try self.jsonDecoder.decode(ItemModel.self, from: _data)
                            
                            if (200...399).contains(statusCode) {

                                observer.onNext(objs)
                            }
                            else {
                                if (error != nil) {
                                    observer.onError(error!)
                                }
                                else {
                                    observer.onNext(objs)
                                }
                            }
                        }
                        
                    } catch {
                        
                    }
                }

                observer.onCompleted()
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
