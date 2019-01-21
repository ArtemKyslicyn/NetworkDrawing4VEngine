//
//  Figure.swift
//  NetworkDrawing4VEngine
//
//  Created by Artem Kislitsyn on 14.01.2019.
//  Copyright © 2019 FreeIPA Mobile. All rights reserved.
//

import Foundation

struct Point : IObjectResponce , Codable {
	let x:Double
	let y:Double
	
	init(x: Double, y: Double) {
	
		self.x = x
		self.y = y
	}
}

struct Figure : IObjectResponce , Codable{
	let array : [Point]
	
	enum CodingKeys : String, CodingKey {
		case array
	}
	
	 init(from decoder:Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		array = try values.decode([Point].self, forKey: .array)
	}
	
	init(array : [Point]) {
		self.array = array
	}
	
}
