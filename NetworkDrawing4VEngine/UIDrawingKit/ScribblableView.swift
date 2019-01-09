//
//  Scribblable.swift
//  SmoothScribble
//
//  Created by Simon Gladman on 05/11/2015.
//  Copyright © 2015 Simon Gladman. All rights reserved.
//

import UIKit

// MARK: Scribblable protocol

protocol Scribblable
{
    func beginScribble(point: CGPoint)
    func appendScribble(point: CGPoint)
    func endScribble()
    func clearScribble()
}

// MARK: ScribbleView base class

class ScribbleView: UIImageView
{
    let backgroundLayer = CAShapeLayer()
    let drawingLayer = CAShapeLayer()
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder);
		backgroundLayer.strokeColor = UIColor.blue.cgColor
		backgroundLayer.fillColor = nil
		backgroundLayer.lineWidth = 2
		
		drawingLayer.strokeColor = UIColor.blue.cgColor
		drawingLayer.fillColor = nil
		drawingLayer.lineWidth = 2
		
		layer.addSublayer(backgroundLayer)
		layer.addSublayer(drawingLayer)
		//layer.
		layer.borderColor = UIColor.blue.cgColor
		layer.borderWidth = 1
		
		layer.masksToBounds = true
	}
    
   
    override func layoutSubviews()
    {
		
    }
}

// MARK: Simple line drawing from point to point

class SimpleScribbleView: ScribbleView, Scribblable
{
    let simplePath = UIBezierPath()
    
    func beginScribble(point: CGPoint)
    {
        simplePath.removeAllPoints()
        
		simplePath.move(to: point)
    }
    
    func appendScribble(point: CGPoint)
    {
		simplePath.addLine(to: point)
        
		drawingLayer.path = simplePath.cgPath
    }
    
    func endScribble()
    {
        if let backgroundPath = backgroundLayer.path
        {
			simplePath.append(UIBezierPath(cgPath: backgroundPath))
        }
        
		backgroundLayer.path = simplePath.cgPath
        
        simplePath.removeAllPoints()
        
		drawingLayer.path = simplePath.cgPath
    }
    
    func clearScribble()
    {
        backgroundLayer.path = nil
		
    }
}

// MARK: Hermite interpolation implementation of ScribbleView

class HermiteScribbleView: ScribbleView, Scribblable
{
    let hermitePath = UIBezierPath()
    var interpolationPoints = [CGPoint]()
    
    func beginScribble(point: CGPoint)
    {
        interpolationPoints = [point]
    }

    func appendScribble(point: CGPoint)
    {
        interpolationPoints.append(point)
        
        hermitePath.removeAllPoints()
	 hermitePath.interpolatePointsWithHermite(interpolationPoints: interpolationPoints)
        
		drawingLayer.path = hermitePath.cgPath
		//5hermitePath.cgPath.
    }
    
    func endScribble()
    {
        if let backgroundPath = backgroundLayer.path
        {
			hermitePath.append(UIBezierPath(cgPath: backgroundPath))
        }
        
		backgroundLayer.path = hermitePath.cgPath
        
        hermitePath.removeAllPoints()
        
		drawingLayer.path = hermitePath.cgPath
    }
    
    func clearScribble()
    {
        backgroundLayer.path = nil
		hermitePath.removeAllPoints()
		drawingLayer.path = nil
    }
}

extension UIBezierPath
{
	func interpolatePointsWithHermite(interpolationPoints : [CGPoint], alpha : CGFloat = 1.0/3.0)
	{
		guard !interpolationPoints.isEmpty else { return }
		self.move(to: interpolationPoints[0])
		
		let n = interpolationPoints.count - 1
		
		for index in 0..<n
		{
			var currentPoint = interpolationPoints[index]
			var nextIndex = (index + 1) % interpolationPoints.count
			var prevIndex = index == 0 ? interpolationPoints.count - 1 : index - 1
			var previousPoint = interpolationPoints[prevIndex]
			var nextPoint = interpolationPoints[nextIndex]
			let endPoint = nextPoint
			var mx : CGFloat
			var my : CGFloat
			
			if index > 0
			{
				mx = (nextPoint.x - previousPoint.x) / 2.0
				my = (nextPoint.y - previousPoint.y) / 2.0
			}
			else
			{
				mx = (nextPoint.x - currentPoint.x) / 2.0
				my = (nextPoint.y - currentPoint.y) / 2.0
			}
			
			let controlPoint1 = CGPoint(x: currentPoint.x + mx * alpha, y: currentPoint.y + my * alpha)
			currentPoint = interpolationPoints[nextIndex]
			nextIndex = (nextIndex + 1) % interpolationPoints.count
			prevIndex = index
			previousPoint = interpolationPoints[prevIndex]
			nextPoint = interpolationPoints[nextIndex]
			
			if index < n - 1
			{
				mx = (nextPoint.x - previousPoint.x) / 2.0
				my = (nextPoint.y - previousPoint.y) / 2.0
			}
			else
			{
				mx = (currentPoint.x - previousPoint.x) / 2.0
				my = (currentPoint.y - previousPoint.y) / 2.0
			}
			
			let controlPoint2 = CGPoint(x: currentPoint.x - mx * alpha, y: currentPoint.y - my * alpha)
			
			self.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
		}
	}
}
