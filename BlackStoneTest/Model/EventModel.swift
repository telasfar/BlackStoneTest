//  BlackStoneTest
//
//  Created by Tariq Maged on 28/01/2022.
//


import Foundation
struct EventModel : Codable {
	let events : [Events]?
	let meta : Meta?

	enum CodingKeys: String, CodingKey {

		case events = "events"
		case meta = "meta"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		events = try values.decodeIfPresent([Events].self, forKey: .events)
		meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
	}
    
    init(events:[Events]){
        self.events = events
        meta = nil
    }

}
