//
//  ViewController.swift
//  scribble
//
//  Created by Dhanush Thotadur Divakara on 9/5/17.
//  Copyright © 2017 Dhanush Thotadur Divakara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // The imageView used as a canvas to draw
	@IBOutlet weak var settingButton: UIButton!
	@IBOutlet weak var canvasImageView: HermiteScribbleView!
    // A button to toggle between erase/draw functionalty
    @IBOutlet weak var drawToolAction: UIButton!
	
	var clearTimer: Timer?
	
	// Last point on the canvas used to store the location of the touch. Initialized to zero.
    var lastPoint = CGPoint.zero
    var swiped = false
    
    // properties to hold stroke color, size of brush and opacity respectively
    var color:UIColor = UIColor.blue
    var brushSize:CGFloat = 2.0
    var opacityValue:CGFloat = 1.0
	var onlyStylus:Bool = true
	var smoothLine = true
    // Indicates the current drawing tool. Drawing pencil or Eraser
   //var drawTool:UIImageView!
    // Boolean to indiacte the state of drawing
    var isDrawing = true
	var timeout :Double = 15
    
    
    
    /**
     drawLines takes the start and end positions and draws a line on the canvas.
     Drawing is done using available methods of graphics image context and setting it to the canvas image.
     - parameters:
        - fromPoint: Starting position from where the drawing will begin
        - toPoint: Ending position of the drawing
     */
    func drawLines(fromPoint:CGPoint,toPoint:CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        canvasImageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
       // drawTool.center = CGPoint(x: toPoint.x + drawTool.frame.width/2, y: toPoint.y - drawTool.frame.height/2)
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.butt)
		context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushSize)
        context?.setStrokeColor(color.cgColor)
        context?.strokePath()
        
        canvasImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // Overriding the touches Began,moved and ended methods to get the initial touch location point and draw the line from last known point to current point.
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		if !smoothLine
		{
			swiped = false
        	if let touch = touches.first{
            	lastPoint = touch.location(in: self.view)
        	}
		}
		else
		{
			
			if let adjustedLocationInView = touches.first?.location(in: canvasImageView)
			{
				canvasImageView.beginScribble(point: adjustedLocationInView)
			}
		}
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		if !smoothLine
		{
			swiped = true
			if let touch = touches.first  {
				if touch.type == .stylus || !onlyStylus
				{
					let currentPoint = touch.location(in: self.view)
					drawLines(fromPoint: lastPoint, toPoint: currentPoint)
					lastPoint = currentPoint
					
				}
			}
		}else
		{
			guard let
				touch = touches.first,
				let coalescedTouches = event?.coalescedTouches(for: touch)
				else
			{
				 return
			}
			if touch.type == .stylus || !onlyStylus
			{
			coalescedTouches.forEach
				{
					canvasImageView.appendScribble(point: $0.location(in: canvasImageView))
					
			}
			}
		}
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		if !smoothLine
		{
        	if !swiped {
            	drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        	}
		}else
		{
			  canvasImageView.endScribble()
			  clearTimer?.invalidate()
			  if (clearTimer != nil)
				{
						clearTimer = Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
				}
		}
			
    }
    
    /**
     resetCanvas is an action method invoked when reset button is pressed.
     The canvas is reset and default settings are restored.
     - parameters:
        - sender: The reset button that invokes the method on press
     */
    @IBAction func resetCanvas(_ sender: Any) {
		self.canvasImageView.clearScribble()
        self.canvasImageView.image = nil
        //drawTool.image = #imageLiteral(resourceName: "icons8-Pencil Drawing Filled_50")
       // drawToolAction.setImage(#imageLiteral(resourceName: "icons8-Erase Filled_50"), for: .normal)
        color  = UIColor.black
        isDrawing = !isDrawing
		
        
    }
    /**
     erase is an action method invoked when erase button is pressed.
     The drawTool toggles between erase tool and the pencil based on the state of the drawing.
     - parameters:
        - sender: The erase button that invokes the method on press
     */
    @IBAction func erase(_ sender: Any) {

		self.canvasImageView.image = nil
		color  = UIColor.blue
		isDrawing = !isDrawing
		self.canvasImageView.clearScribble()
    }
	
    
    override func viewDidLoad() {
        super.viewDidLoad()
		clearTimer = Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
		
		canvasImageView.drawingLayer.strokeColor = UIColor.blue.cgColor
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        super.prepare(for: segue, sender: sender)
//        let settingsViewController = segue.destination as! SettingsViewController
//        settingsViewController.delegate = self
//        settingsViewController.color = color
//        settingsViewController.brushSize = brushSize
//        settingsViewController.opacityValue = opacityValue
//		settingsViewController.timeInterval = self.timeout
    }
	
	@objc func runTimedCode()
	{
		self.canvasImageView.image = nil
		isDrawing = !isDrawing
		self.canvasImageView.clearScribble()
	}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		if motion == .motionShake {
			if settingButton.isHidden{
				settingButton.isHidden = false
			}
			else
			{
				settingButton.isHidden = true
			}
			print("Why are you shaking me?")
		}
	}


}

//extension ViewController:SettingsViewControllerDelegate {
//
//    /**
//    Delegate method of settingsViewController that is invoked on finish.
//    The canvas settings are set using this delegate.
//    - parameters:
//        - settingsViewController: The view controller object which has the properties required to set the canvas settings
//     */
//    func settingsViewControllerDidFinish(_ settingsViewController:SettingsViewController) {
//        self.color = settingsViewController.color
//        self.brushSize = settingsViewController.brushSize
//        self.opacityValue = settingsViewController.opacityValue
//        if(settingsViewController.color != UIColor.white){
//			canvasImageView.drawingLayer.strokeColor = settingsViewController.color.cgColor
//			canvasImageView.backgroundLayer.strokeColor = settingsViewController.color.cgColor
//			canvasImageView.drawingLayer.lineWidth = settingsViewController.brushSize
//			canvasImageView.backgroundLayer.lineWidth = settingsViewController.brushSize
//			self.timeout = settingsViewController.timeInterval
//			self.onlyStylus = settingsViewController.onlyStylus
//			clearTimer?.invalidate()
//			clearTimer = Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
//        }
//        print("values changed")
//
//    }
//
//}

