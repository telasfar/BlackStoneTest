//
//  EventServices.swift
//  DuppizleTest
//
//  Created by Tariq Maged on 28/1/2022.
//

import Foundation
import Combine


enum ServiceError: Error {
    case url(URLError)
    case urlRequest
    case decode
}

protocol EventServiceProtocol {
    func getEvents(queryValue:String) -> AnyPublisher<EventModel, Error>
}

class EventServices:EventServiceProtocol{
    
    
    static let instance = EventServices() //Singleton Design patteren
        
        func getEvents(queryValue:String) -> AnyPublisher<EventModel, Error> {
            
            var dataTask: URLSessionDataTask?
            
            let onSubscription: (Subscription) -> Void = { _ in dataTask?.resume() }
            let onCancel: () -> Void = { dataTask?.cancel() }

            return Future<EventModel, Error> { [weak self] promise in
                guard let urlRequest = self?.getUrlRequest(queryValue: queryValue) else {
                    promise(.failure(ServiceError.urlRequest))
                    return
                }
                
                dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
                    guard let data = data else {
                        if let error = error {
                            promise(.failure(error))
                        }
                        return
                    }
                    do {
                        let events = try JSONDecoder().decode(EventModel.self, from: data)
                        promise(.success(events))
                    } catch {
                        promise(.failure(ServiceError.decode))
                    }
                }
            }
            .handleEvents(receiveSubscription: onSubscription, receiveCancel: onCancel)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        }
    
    //https://api.seatgeek.com/2/events?client_id=MjU1MDY0OTF8MTY0MzI5NTYxMS4yNDMxMjU3&q=Texas+Ranger

    private func getUrlRequest(queryValue:String) -> URLRequest? {
        var components = URLComponents()
        let queryItems = [URLQueryItem(name: "client_id", value: "MjU1MDY0OTF8MTY0MzI5NTYxMS4yNDMxMjU3"), URLQueryItem(name: "q", value: "\(queryValue)")]
        components.scheme = "https"
        components.host = "api.seatgeek.com"
        components.path = "/2/events"
        components.queryItems = queryItems
        guard let url = components.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = 10.0
        urlRequest.httpMethod = "GET"
        return urlRequest
    }

    func testFetchEvents(queryValue: String,complition: @escaping (_ status:Bool,_ product:EventModel?)->Void){
        guard let urlRequest = getUrlRequest(queryValue: queryValue) else {return}
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, err) in
            if let data = data{
                do{
                    let responseModel = try JSONDecoder().decode(EventModel.self, from: data)
                    complition(true,responseModel)
                }catch{
                    complition(false,nil)
                    debugPrint(error.localizedDescription)
                }
            }else{
                complition(false,nil)
            }
        }
        task.resume()
    }

}
