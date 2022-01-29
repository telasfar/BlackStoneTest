//  BlackStoneTest
//
//  Created by Tariq Maged on 28/01/2022.
//


import Foundation
struct Performers : Codable {
	let type : String?
	let name : String?
	let image : String?
	let id : Int?
	let images : Images?
	let has_upcoming_events : Bool?
	let primary : Bool?
	let stats : Stats?
	let taxonomies : [Taxonomies]?
	let image_attribution : String?
	let url : String?
	let score : Double?
	let slug : String?
	let home_venue_id : Int?
	let short_name : String?
	let num_upcoming_events : Int?
	let image_license : String?
	let genres : [Genres]?
	let popularity : Int?
	let location : Location?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case name = "name"
		case image = "image"
		case id = "id"
		case images = "images"
		case has_upcoming_events = "has_upcoming_events"
		case primary = "primary"
		case stats = "stats"
		case taxonomies = "taxonomies"
		case image_attribution = "image_attribution"
		case url = "url"
		case score = "score"
		case slug = "slug"
		case home_venue_id = "home_venue_id"
		case short_name = "short_name"
		case num_upcoming_events = "num_upcoming_events"
		case image_license = "image_license"
		case genres = "genres"
		case popularity = "popularity"
		case location = "location"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		images = try values.decodeIfPresent(Images.self, forKey: .images)
		has_upcoming_events = try values.decodeIfPresent(Bool.self, forKey: .has_upcoming_events)
		primary = try values.decodeIfPresent(Bool.self, forKey: .primary)
		stats = try values.decodeIfPresent(Stats.self, forKey: .stats)
		taxonomies = try values.decodeIfPresent([Taxonomies].self, forKey: .taxonomies)
		image_attribution = try values.decodeIfPresent(String.self, forKey: .image_attribution)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		score = try values.decodeIfPresent(Double.self, forKey: .score)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		home_venue_id = try values.decodeIfPresent(Int.self, forKey: .home_venue_id)
		short_name = try values.decodeIfPresent(String.self, forKey: .short_name)
		num_upcoming_events = try values.decodeIfPresent(Int.self, forKey: .num_upcoming_events)
		image_license = try values.decodeIfPresent(String.self, forKey: .image_license)
		genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
		popularity = try values.decodeIfPresent(Int.self, forKey: .popularity)
		location = try values.decodeIfPresent(Location.self, forKey: .location)
	}

}
