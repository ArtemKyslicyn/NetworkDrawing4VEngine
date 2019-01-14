//
//  Figure.swift
//  NetworkDrawing4VEngine
//
//  Created by Artem Kislitsyn on 14.01.2019.
//  Copyright © 2019 FreeIPA Mobile. All rights reserved.
//

import Foundation

struct Point : IObjectResponce {
	let x:Double
	let y:Double
	
	init(x: Double, y: Double) {
	
		self.x = x
		self.y = y
	}
}

struct Figure : IObjectResponce {
	let array : [Point]
	
	init(array : [Point]) {
		self.array = array
	}
	
}
