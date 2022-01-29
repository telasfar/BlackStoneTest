//  BlackStoneTest
//
//  Created by Tariq Maged on 28/01/2022.
//


import Foundation
struct Images : Codable {
	let s1200x525 : String?
	let s1200x627 : String?
	let s136x136 : String?
	let s500_700 : String?
	let s800x320 : String?
	let banner : String?
	let block : String?
	let criteo_130_160 : String?
	let criteo_170_235 : String?
	let criteo_205_100 : String?
	let criteo_400_300 : String?
	let fb_100x72 : String?
	let fb_600_315 : String?
	let huge : String?
	let ipad_event_modal : String?
	let ipad_header : String?
	let ipad_mini_explore : String?
	let mongo : String?
	let square_mid : String?
	let triggit_fb_ad : String?

	enum CodingKeys: String, CodingKey {

		case s1200x525 = "1200x525"
		case s1200x627 = "1200x627"
		case s136x136 = "136x136"
		case s500_700 = "500_700"
		case s800x320 = "800x320"
		case banner = "banner"
		case block = "block"
		case criteo_130_160 = "criteo_130_160"
		case criteo_170_235 = "criteo_170_235"
		case criteo_205_100 = "criteo_205_100"
		case criteo_400_300 = "criteo_400_300"
		case fb_100x72 = "fb_100x72"
		case fb_600_315 = "fb_600_315"
		case huge = "huge"
		case ipad_event_modal = "ipad_event_modal"
		case ipad_header = "ipad_header"
		case ipad_mini_explore = "ipad_mini_explore"
		case mongo = "mongo"
		case square_mid = "square_mid"
		case triggit_fb_ad = "triggit_fb_ad"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		s1200x525 = try values.decodeIfPresent(String.self, forKey: .s1200x525)
		s1200x627 = try values.decodeIfPresent(String.self, forKey: .s1200x627)
		s136x136 = try values.decodeIfPresent(String.self, forKey: .s136x136)
		s500_700 = try values.decodeIfPresent(String.self, forKey: .s500_700)
		s800x320 = try values.decodeIfPresent(String.self, forKey: .s800x320)
		banner = try values.decodeIfPresent(String.self, forKey: .banner)
		block = try values.decodeIfPresent(String.self, forKey: .block)
		criteo_130_160 = try values.decodeIfPresent(String.self, forKey: .criteo_130_160)
		criteo_170_235 = try values.decodeIfPresent(String.self, forKey: .criteo_170_235)
		criteo_205_100 = try values.decodeIfPresent(String.self, forKey: .criteo_205_100)
		criteo_400_300 = try values.decodeIfPresent(String.self, forKey: .criteo_400_300)
		fb_100x72 = try values.decodeIfPresent(String.self, forKey: .fb_100x72)
		fb_600_315 = try values.decodeIfPresent(String.self, forKey: .fb_600_315)
		huge = try values.decodeIfPresent(String.self, forKey: .huge)
		ipad_event_modal = try values.decodeIfPresent(String.self, forKey: .ipad_event_modal)
		ipad_header = try values.decodeIfPresent(String.self, forKey: .ipad_header)
		ipad_mini_explore = try values.decodeIfPresent(String.self, forKey: .ipad_mini_explore)
		mongo = try values.decodeIfPresent(String.self, forKey: .mongo)
		square_mid = try values.decodeIfPresent(String.self, forKey: .square_mid)
		triggit_fb_ad = try values.decodeIfPresent(String.self, forKey: .triggit_fb_ad)
	}

}
