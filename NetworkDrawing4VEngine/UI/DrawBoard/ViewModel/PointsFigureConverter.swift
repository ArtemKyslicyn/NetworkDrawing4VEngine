//
//  PointsFigureComverter.swift
//  NetworkDrawing4VEngine
//
//  Created by Artem Kislitsyn on 15.01.2019.
//  Copyright © 2019 FreeIPA Mobile. All rights reserved.
//

import Foundation
import UIKit

class PointsFigureConverter{
	func pointsToFigureConverter(points:[CGPoint]) -> Figure
	{
		var pointsArray = [Point]()
		for point in points
		{
			pointsArray.append(Point(x: Double(point.x), y: Double(point.y)))
		}
		
		return Figure(array:pointsArray)
	}
	
	func figureToPointsConverter(figure:Figure) -> [CGPoint]
	{
		var pointsArray = [CGPoint]()
		
		for point in figure.array
		{
			pointsArray.append(CGPoint(x: point.x, y: point.y))
		}
		
		return pointsArray
	}
	
}
