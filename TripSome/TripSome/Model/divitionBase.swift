

import UIKit

struct DivitionBase : Codable {
	let pk : Int?
	let divname : String?
	let divimage : String?

	enum CodingKeys: String, CodingKey {

		case pk = "pk"
		case divname = "divname"
		case divimage = "divimage"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		
        pk = try values.decodeIfPresent(Int.self, forKey: .pk)
		divname = try values.decodeIfPresent(String.self, forKey: .divname)
		divimage = try values.decodeIfPresent(String.self, forKey: .divimage)
	}

}
