//
//  MockEventService.swift
//  BlackStoneTest
//
//  Created by Tariq Maged on 29/01/2022.
//

import Foundation
import Combine

class MockEventService: EventServiceProtocol {
    
    var getCallsCount: Int = 0

    var getResult: Result<EventModel, Error> = .success(EventModel(events: []))

    func getEvents(queryValue: String) -> AnyPublisher<EventModel, Error> {
        getCallsCount += 1

        return getResult.publisher.eraseToAnyPublisher()
    }
}
