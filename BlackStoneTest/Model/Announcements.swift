//  BlackStoneTest
//
//  Created by Tariq Maged on 28/01/2022.
//

import Foundation
struct Announcements : Codable {
    
    let announcements : String?

	enum CodingKeys: String, CodingKey {
       case announcements = "announcements"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        announcements = try values.decodeIfPresent(String.self, forKey: .announcements)
	}

}
