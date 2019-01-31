//
//  DrawBoardViewController.swift
//
//  4VEngine


import UIKit

class DrawBoardViewController: UIViewController {

	// The imageView used as a canvas to draw
	@IBOutlet weak var settingButton: UIButton!
	@IBOutlet weak var canvasImageView: HermiteScribbleView!
	// A button to toggle between erase/draw functionalty
	@IBOutlet weak var drawToolAction: UIButton!
	
    private  let viewModel: DrawBoardViewModel
	
	
    init(viewModel: DrawBoardViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
		
		self.viewModel.recivePointsForFigure = { points in
			
		}
    }
	
	func drawPoints(points:[CGPoint])
	{
		
		
		canvasImageView.beginScribble(point: points.first!)
		points.forEach  {
			canvasImageView.appendScribble(point: $0)
		}
		canvasImageView.endScribble()
	}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		settingButton.isHidden = false;
		canvasImageView.drawingLayer.strokeColor = UIColor.blue.cgColor
		settingButton.addTarget(self, action: #selector(settingsAction), for: .touchUpInside)
    }
	
	@IBAction func settingsAction(_ sender: Any) {
		viewModel.openWithSettings(settings: self.viewModel.settings)
	}
	
    @IBAction func onCloseButton(_ sender: Any) {
        viewModel.closeButtonDidTap()
    }
	
	@IBAction func erase(_ sender: Any) {
		self.canvasImageView.image = nil
		viewModel.clear()
		self.canvasImageView.clearScribble()
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
	
	// Overriding the touches Began,moved and ended methods to get the initial touch location point and draw the line from last known point to current point.
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		canvasImageView.drawingLayer.strokeColor =  self.viewModel.settings.color.cgColor
		canvasImageView.backgroundLayer.strokeColor =  self.viewModel.settings.color.cgColor
		canvasImageView.drawingLayer.lineWidth =  self.viewModel.settings.brushSize
		
		if !viewModel.settings.smoothLine
		{
			viewModel.swiped = false
			if let touch = touches.first{
				viewModel.lastPoint = touch.location(in: self.view)
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
		if !viewModel.settings.smoothLine
		{
			viewModel.swiped = true
			if let touch = touches.first  {
				if touch.type == .stylus || !viewModel.settings.onlyStylus
				{
					let currentPoint = touch.location(in: self.view)
					self.canvasImageView.image = viewModel.drawLines(fromPoint: viewModel.lastPoint, toPoint: currentPoint, frame: self.view.frame)
		
				    viewModel.lastPoint = currentPoint
					
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
			if touch.type == .stylus || !viewModel.settings.onlyStylus
			{
				let currentPoint = touch.location(in: self.view)
				viewModel.sendFigure(fromPoint:viewModel.lastPoint,toPoint:currentPoint)
				coalescedTouches.forEach
					{
						canvasImageView.appendScribble(point: $0.location(in: canvasImageView))
						
				}
				viewModel.lastPoint = currentPoint
			}
		}
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		if !viewModel.settings.smoothLine {
			if !viewModel.swiped {
				self.canvasImageView.image = viewModel.drawLines(fromPoint: viewModel.lastPoint, toPoint: viewModel.lastPoint,frame:self.view.frame)
			}
		}else{
			canvasImageView.endScribble()

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
		viewModel.settings.color  = UIColor.black
		viewModel.isDrawing = !viewModel.isDrawing
	}
}



