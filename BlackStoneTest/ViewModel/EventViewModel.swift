//
//  ProductViewModel.swift
//  DuppizleTest
//
//  Created by Tariq Maged on 13/11/2021.
//

import Foundation
import Combine

enum EventViewModelState: Equatable {
    case loading
    case finishedLoading
    case error
}

final class EventViewModel {
   // enum Section { case players }

    @Published private(set) var eventModel: EventModel?
    @Published private(set) var state: EventViewModelState = .loading
  
    private var cancelable = Set<AnyCancellable>()
    var eventService:EventServiceProtocol
    
    init(eventService: EventServiceProtocol = EventServices.instance) {
        self.eventService = eventService
    }

    func fetchEvents(queryValue:String) {
        state = .loading
        let eventCompletionHandler: (Subscribers.Completion<Error>) -> Void = { [weak self] completion in
            switch completion {
            case .failure:
                self?.state = .error
            case .finished:
                self?.state = .finishedLoading
            }
        }
        
        eventService.getEvents(queryValue:queryValue)
            .sink(receiveCompletion: eventCompletionHandler, receiveValue: { [weak self] event in
                self?.eventModel = event
            })
            .store(in: &cancelable)
    }
}
