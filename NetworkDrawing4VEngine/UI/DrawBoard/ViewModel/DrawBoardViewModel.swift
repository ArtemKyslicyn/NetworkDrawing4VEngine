
import UIKit


final class DrawBoardViewModel {
    
	public let settings:Settings
	let interactor = DrawBoardInteractor()
	var clearTimer: Timer?
	var lastPoint = CGPoint.zero
	var swiped = false
	var isDrawing = true
	var timeout :Double = 15
	var points : [CGPoint] = [CGPoint]();
	let pointsConverter = PointsFigureConverter()
	
    private  var navigationDelegate: DrawBoardNavigationDelegate?
    
    init(settings: Settings, navigationDelegate: DrawBoardNavigationDelegate) {
        self.settings = settings
        self.navigationDelegate = navigationDelegate
		
		clearTimer = Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
	
	func sendFigure(fromPoint:CGPoint,toPoint:CGPoint)
	{
		points.append(fromPoint)
		points.append(toPoint)
		let figure = pointsConverter.pointsToFigureConverter(points: points)
		self.interactor.sendFigure(figure: figure)
	}
	
	func drawLines(fromPoint:CGPoint,toPoint:CGPoint,frame:CGRect) -> UIImage? {
		
		self.sendFigure(fromPoint: fromPoint, toPoint: toPoint);
		
		let context = UIGraphicsGetCurrentContext()
		context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
		context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
		context?.setBlendMode(CGBlendMode.normal)
		context?.setLineCap(CGLineCap.butt)
		context?.setLineCap(CGLineCap.round)
		context?.setLineWidth(self.settings.brushSize)
		context?.setStrokeColor(self.settings.color.cgColor)
		context?.strokePath()
		return UIGraphicsGetImageFromCurrentImageContext()
	}
	
	@objc func runTimedCode()
	{
		isDrawing = !isDrawing
		//self.canvasImageView.clearScribble()
	}
	
	func openWithSettings(settings:Settings) {
		
		navigationDelegate?.openSettingsWith(settings: self.settings)
		// navigationDelegate?.userDetailsCloseDidTap()
	}
	
    func closeButtonDidTap() {
       // navigationDelegate?.userDetailsCloseDidTap()
    }
	
	func clear()
	{
		self.isDrawing = !self.isDrawing
	}
	
	func updateTimer()
	{
		clearTimer?.invalidate()
		if (clearTimer != nil)
		{
			clearTimer = Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
		}
	}
}
