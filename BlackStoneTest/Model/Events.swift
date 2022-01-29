//  BlackStoneTest
//
//  Created by Tariq Maged on 28/01/2022.
//


import Foundation
struct Events : Codable {
	let type : String?
	let id : Int?
	let datetime_utc : String?
	let venue : Venue?
	let datetime_tbd : Bool?
	let performers : [Performers]?
	let is_open : Bool?
	let links : [String]?
	let datetime_local : String?
	let time_tbd : Bool?
	let short_title : String?
	let visible_until_utc : String?
	let stats : Stats?
	let taxonomies : [Taxonomies]?
	let url : String?
	let score : Double?
	let announce_date : String?
	let created_at : String?
	let date_tbd : Bool?
	let title : String?
	let popularity : Double?
	let description : String?
	let status : String?
	let announcements : Announcements?
	let conditional : Bool?
	let enddatetime_utc : String?
	let themes : [String]?
	let domain_information : [String]?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case id = "id"
		case datetime_utc = "datetime_utc"
		case venue = "venue"
		case datetime_tbd = "datetime_tbd"
		case performers = "performers"
		case is_open = "is_open"
		case links = "links"
		case datetime_local = "datetime_local"
		case time_tbd = "time_tbd"
		case short_title = "short_title"
		case visible_until_utc = "visible_until_utc"
		case stats = "stats"
		case taxonomies = "taxonomies"
		case url = "url"
		case score = "score"
		case announce_date = "announce_date"
		case created_at = "created_at"
		case date_tbd = "date_tbd"
		case title = "title"
		case popularity = "popularity"
		case description = "description"
		case status = "status"
		case announcements = "announcements"
		case conditional = "conditional"
		case enddatetime_utc = "enddatetime_utc"
		case themes = "themes"
		case domain_information = "domain_information"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		datetime_utc = try values.decodeIfPresent(String.self, forKey: .datetime_utc)
		venue = try values.decodeIfPresent(Venue.self, forKey: .venue)
		datetime_tbd = try values.decodeIfPresent(Bool.self, forKey: .datetime_tbd)
		performers = try values.decodeIfPresent([Performers].self, forKey: .performers)
		is_open = try values.decodeIfPresent(Bool.self, forKey: .is_open)
		links = try values.decodeIfPresent([String].self, forKey: .links)
		datetime_local = try values.decodeIfPresent(String.self, forKey: .datetime_local)
		time_tbd = try values.decodeIfPresent(Bool.self, forKey: .time_tbd)
		short_title = try values.decodeIfPresent(String.self, forKey: .short_title)
		visible_until_utc = try values.decodeIfPresent(String.self, forKey: .visible_until_utc)
		stats = try values.decodeIfPresent(Stats.self, forKey: .stats)
		taxonomies = try values.decodeIfPresent([Taxonomies].self, forKey: .taxonomies)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		score = try values.decodeIfPresent(Double.self, forKey: .score)
		announce_date = try values.decodeIfPresent(String.self, forKey: .announce_date)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		date_tbd = try values.decodeIfPresent(Bool.self, forKey: .date_tbd)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		announcements = try values.decodeIfPresent(Announcements.self, forKey: .announcements)
		conditional = try values.decodeIfPresent(Bool.self, forKey: .conditional)
		enddatetime_utc = try values.decodeIfPresent(String.self, forKey: .enddatetime_utc)
		themes = try values.decodeIfPresent([String].self, forKey: .themes)
		domain_information = try values.decodeIfPresent([String].self, forKey: .domain_information)
	}

}
