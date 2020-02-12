/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct placesBase : Codable {
	let pname : String?
	let pimage : String?
	let plocation : String?
	let pinfo : String?
	let phistory : String?
	let pmedicaltips : String?
	let pfoodtips : String?
	let ptransporttips : String?
	let otherstips : String?
	let rating : String?
	let pdivID : Int?
	let pdisID : Int?

	enum CodingKeys: String, CodingKey {

		case pname = "pname"
		case pimage = "pimage"
		case plocation = "plocation"
		case pinfo = "pinfo"
		case phistory = "phistory"
		case pmedicaltips = "pmedicaltips"
		case pfoodtips = "pfoodtips"
		case ptransporttips = "ptransporttips"
		case otherstips = "otherstips"
		case rating = "rating"
		case pdivID = "pdivID"
		case pdisID = "pdisID"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pname = try values.decodeIfPresent(String.self, forKey: .pname)
		pimage = try values.decodeIfPresent(String.self, forKey: .pimage)
		plocation = try values.decodeIfPresent(String.self, forKey: .plocation)
		pinfo = try values.decodeIfPresent(String.self, forKey: .pinfo)
		phistory = try values.decodeIfPresent(String.self, forKey: .phistory)
		pmedicaltips = try values.decodeIfPresent(String.self, forKey: .pmedicaltips)
		pfoodtips = try values.decodeIfPresent(String.self, forKey: .pfoodtips)
		ptransporttips = try values.decodeIfPresent(String.self, forKey: .ptransporttips)
		otherstips = try values.decodeIfPresent(String.self, forKey: .otherstips)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		pdivID = try values.decodeIfPresent(Int.self, forKey: .pdivID)
		pdisID = try values.decodeIfPresent(Int.self, forKey: .pdisID)
	}

}
