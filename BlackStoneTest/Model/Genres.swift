//  BlackStoneTest
//
//  Created by Tariq Maged on 28/01/2022.
//


import Foundation
struct Genres : Codable {
	let id : Int?
	let name : String?
	let slug : String?
	let primary : Bool?
	let images : Images?
	let image : String?
	let document_source : Document_source?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case slug = "slug"
		case primary = "primary"
		case images = "images"
		case image = "image"
		case document_source = "document_source"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		primary = try values.decodeIfPresent(Bool.self, forKey: .primary)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		document_source = try values.decodeIfPresent(Document_source.self, forKey: .document_source)
	}

}
