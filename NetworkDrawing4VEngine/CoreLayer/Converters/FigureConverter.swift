//
//  FigureConverter.swift
//  NetworkDrawing4VEngine
//
//  Created by Artem Kislitsyn on 15.01.2019.
//  Copyright © 2019 FreeIPA Mobile. All rights reserved.
//

import Foundation


class FigureConverter {
	
	func convertFigureToData(figure:Figure) -> Data {
		let jsonEncoder =  JSONEncoder()
		let jsonData = try? jsonEncoder.encode(figure)
		print("Sending data \(String(decoding: jsonData ?? Data(), as: UTF8.self))")
		return jsonData ?? Data();
	}
	
	func convertDataToFigure(data:Data) -> Figure {
		let jsonString = String(decoding: data, as: UTF8.self)
		let jsonData = jsonString.data(using: .utf8)!
		let decoder = JSONDecoder()
		let figure = try! decoder.decode(Figure.self, from: jsonData)
		return figure
	}
}
