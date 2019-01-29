
import UIKit


final class DrawBoardViewModel {
    
	public var settings:Settings
	public let interactor = DrawBoardInteractor()
	public var clearTimer: Timer?
	public var lastPoint = CGPoint.zero
	public var swiped = false
	public var isDrawing = true
	public var timeout :Double = 15
	public var points : [CGPoint] = [CGPoint]();
	public let pointsConverter = PointsFigureConverter()
	public var recivePointsForFigure :(([CGPoint]) -> ())?
	
    private  var navigationDelegate: DrawBoardNavigationDelegate?
    
    init(settings: Settings, navigationDelegate: DrawBoardNavigationDelegate) {
        self.settings = settings
        self.navigationDelegate = navigationDelegate
		
		clearTimer = Timer.scheduledTimer(timeInterval: self.timeout, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
		
		self.interactor.reciveFigure = { figure in
			self.getFigure(figure: figure)
		}
    }
	
	func updateSettings(settings:Settings) {
		self.settings = settings
	}
	
	func getFigure(figure:Figure)
	{
		let points = pointsConverter.figureToPointsConverter(figure:figure)
		self.recivePointsForFigure?(points)
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
	
	@objc func runTimedCode(){
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
