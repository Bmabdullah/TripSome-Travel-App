

import UIKit
struct UserBase : Codable {
	let email : String?
	let username : String?
	let mobile_number : String?
	let user_image : String?
	let status : Bool?

	enum CodingKeys: String, CodingKey {

		case email = "email"
		case username = "username"
		case mobile_number = "mobile_number"
		case user_image = "user_image"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		mobile_number = try values.decodeIfPresent(String.self, forKey: .mobile_number)
		user_image = try values.decodeIfPresent(String.self, forKey: .user_image)
		status = try values.decodeIfPresent(Bool.self, forKey: .status)
	}

}
