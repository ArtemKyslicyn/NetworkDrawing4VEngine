var entities =
[{
  "id": 1,
  "typeString": "class",
  "properties": [
    {
  "name": "var settings:Settings!",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "var navigationDelegate: SettingsNavigationDelegate?",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "closeButtonDidTap()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(settings: Settings, navigationDelegate: SettingsNavigationDelegate)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingsViewModel"
},{
  "id": 2,
  "typeString": "class",
  "properties": [
    {
  "name": "var viewModel: SettingsViewModel",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var viewController: SettingsViewController",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(settings: Settings, navigationDelegate: SettingsNavigationDelegate)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingsViewFactory"
},{
  "id": 3,
  "typeString": "class",
  "properties": [
    {
  "name": "var timerLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var neatColorPicker: ChromaColorPicker!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var timerSlider: UISlider!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var brushSlider: UISlider!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var opacitySlider: UISlider!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stylusSwitch: UISwitch!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var brushView: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var color:UIColor",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var brushSize:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var opacityValue:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var timeInterval:Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var onlyStylus:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let viewModel: SettingsViewModel required",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "onCloseButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "stylusValueChanged(_ sender: UISwitch)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "colorChanged(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "timerChanged(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "brushSizeChanged(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "opacityChanged(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "settingsSelected(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "drawPreview (color:UIColor)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(viewModel: SettingsViewModel)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingsViewController",
  "superClass": 47
},{
  "id": 4,
  "typeString": "class",
  "properties": [
    {
  "name": "let viewFactory: SettingsViewFactory",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "present(in parentViewController: UIViewController)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "remove()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(settings: Settings, navigationDelegate: SettingsNavigationDelegate)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    12
  ],
  "name": "SettingDetailsViewPresenter"
},{
  "id": 5,
  "typeString": "protocol",
  "methods": [
    {
  "name": "openSettingsWith(settings:Settings)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DrawBoardNavigationDelegate",
  "superClass": 48
},{
  "id": 6,
  "typeString": "protocol",
  "methods": [
    {
  "name": "openSettingsWith(settings:Settings)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "settingsCloseDidTap()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingsNavigationDelegate",
  "superClass": 48
},{
  "id": 7,
  "typeString": "protocol",
  "methods": [
    {
  "name": "settingsCloseDidTap()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BoardDrawNavigationDelegate",
  "superClass": 48
},{
  "id": 8,
  "typeString": "class",
  "properties": [
    {
  "name": "let parentViewController: UIViewController",
  "type": "instance",
  "accessLevel": "fileprivate"
},
    {
  "name": "var presenters",
  "type": "instance",
  "accessLevel": "fileprivate"
}
  ],
  "methods": [
    {
  "name": "init(parentViewController: UIViewController)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DrawingRouter",
  "extensions": [
    9,
    10,
    11
  ]
},{
  "id": 12,
  "typeString": "protocol",
  "methods": [
    {
  "name": "present(in parentViewController: UIViewController)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "remove()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ViewPresenter",
  "superClass": 48
},{
  "id": 13,
  "typeString": "protocol",
  "methods": [
    {
  "name": "showInitial()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "close()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Router",
  "superClass": 48
},{
  "id": 14,
  "typeString": "class",
  "properties": [
    {
  "name": "let settings:Settings",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "let interactor",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var clearTimer: Timer?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lastPoint",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var swiped",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isDrawing",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var timeout :Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var points : [CGPoint]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let pointsConverter",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var navigationDelegate: DrawBoardNavigationDelegate? @objc",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "drawLines(fromPoint:CGPoint,toPoint:CGPoint,frame:CGRect) -> UIImage?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "runTimedCode()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "openWithSettings(settings:Settings)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "closeButtonDidTap()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "clear()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateTimer()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(settings: Settings, navigationDelegate: DrawBoardNavigationDelegate)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DrawBoardViewModel"
},{
  "id": 15,
  "typeString": "class",
  "methods": [
    {
  "name": "pointsToFigureConverter(points:[CGPoint]) -> Figure",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "PointsFigureConverter"
},{
  "id": 16,
  "typeString": "class",
  "properties": [
    {
  "name": "var viewModel: DrawBoardViewModel",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var viewController: DrawBoardViewController",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(settings: Settings, navigationDelegate: DrawBoardNavigationDelegate)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DrawBoardViewFactory"
},{
  "id": 17,
  "typeString": "class",
  "properties": [
    {
  "name": "var settingButton: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var canvasImageView: HermiteScribbleView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var drawToolAction: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let viewModel: DrawBoardViewModel required",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "settingsAction(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "onCloseButton(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "erase(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "resetCanvas(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(viewModel: DrawBoardViewModel)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DrawBoardViewController",
  "superClass": 47
},{
  "id": 18,
  "typeString": "class",
  "properties": [
    {
  "name": "let viewFactory: DrawBoardViewFactory",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "present(in parentViewController: UIViewController)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "remove()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(settings: Settings, navigationDelegate: DrawBoardNavigationDelegate)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    12
  ],
  "name": "DrawBoardViewPresenter"
},{
  "id": 19,
  "typeString": "class",
  "properties": [
    {
  "name": "let networkingClinet:NetworkClientClient",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "let networkingServer:NetworkServer",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "let figureConverter:FigureConverter",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "methods": [
    {
  "name": "sendFigure(figure:Figure)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DrawBoardInteractor"
},{
  "id": 20,
  "typeString": "protocol",
  "methods": [
    {
  "name": "settingsViewControllerDidFinish(_ settingsViewController:SettingsViewController)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingsViewControllerDelegate",
  "superClass": 48
},{
  "id": 21,
  "typeString": "class",
  "properties": [
    {
  "name": "var timerLabel: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var neatColorPicker: ChromaColorPicker!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var brushSizeSlider: UISlider!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var opacitySlider: UISlider!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var brushView: UIImageView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var timerSlider: UISlider!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stylusSwitch: UISwitch!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var color:UIColor",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var brushSize:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var opacityValue:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var timeInterval:Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var delegate:SettingsViewControllerDelegate?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var onlyStylus:Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "stylusValueChanged(_ sender: UISwitch)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "colorChanged(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "timerChanged(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "brushSizeChanged(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "opacityChanged(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "settingsSelected(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "drawPreview (color:UIColor)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "didReceiveMemoryWarning()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SettingsViewController",
  "superClass": 47
},{
  "id": 22,
  "typeString": "protocol",
  "methods": [
    {
  "name": "beginScribble(point: CGPoint)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "appendScribble(point: CGPoint)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "endScribble()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "clearScribble()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Scribblable"
},{
  "id": 23,
  "typeString": "class",
  "properties": [
    {
  "name": "let backgroundLayer",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let drawingLayer",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "layoutSubviews()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ScribbleView",
  "superClass": 49
},{
  "id": 24,
  "typeString": "class",
  "properties": [
    {
  "name": "let simplePath",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "beginScribble(point: CGPoint)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "appendScribble(point: CGPoint)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "endScribble()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "clearScribble()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SimpleScribbleView",
  "superClass": 23
},{
  "id": 25,
  "typeString": "class",
  "properties": [
    {
  "name": "let hermitePath",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var interpolationPoints",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "beginScribble(point: CGPoint)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "appendScribble(point: CGPoint)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "endScribble()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "clearScribble()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "HermiteScribbleView",
  "superClass": 23
},{
  "id": 26,
  "typeString": "class",
  "properties": [
    {
  "name": "var window: UIWindow?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var mainRouter: Router?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillResignActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidEnterBackground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillEnterForeground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidBecomeActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillTerminate(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    51
  ],
  "name": "AppDelegate",
  "superClass": 50
},{
  "id": 27,
  "typeString": "class",
  "properties": [
    {
  "name": "var connection: NWConnection",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var queue: DispatchQueue",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var controller: UIViewController! convenience",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "send(frame: Data)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "send(frames: [Data], uisngConnection connection: NWConnection)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(usingQueue queue: DispatchQueue)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(withViewController controller: UIViewController, usingQueue queue: DispatchQueue)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "NetworkClientClient"
},{
  "id": 28,
  "typeString": "class",
  "properties": [
    {
  "name": "var listener: NWListener",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var queue: DispatchQueue",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var controller: UIViewController!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var frame",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "recieve(on connection: NWConnection)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(usingQueue queue: DispatchQueue)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(withViewController controller: UIViewController, usingQueue queue: DispatchQueue)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "NetworkServer"
},{
  "id": 29,
  "typeString": "class",
  "methods": [
    {
  "name": "convertFigureToData(figure:Figure) -> Data",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "FigureConverter"
},{
  "id": 30,
  "typeString": "class",
  "properties": [
    {
  "name": "var color:UIColor",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var brushSize:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var opacityValue:CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var timeInterval:Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var onlyStylus:Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var smoothLine",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Settings"
},{
  "id": 31,
  "typeString": "struct",
  "properties": [
    {
  "name": "let x:Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let y:Double",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(x: Double, y: Double)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    33
  ],
  "name": "Point"
},{
  "id": 32,
  "typeString": "struct",
  "properties": [
    {
  "name": "let array : [Point]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(array : [Point])",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    33
  ],
  "name": "Figure"
},{
  "id": 33,
  "typeString": "protocol",
  "name": "IObjectResponce"
},{
  "id": 34,
  "typeString": "class",
  "properties": [
    {
  "name": "let gradient",
  "type": "instance",
  "accessLevel": "open"
}
  ],
  "methods": [
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init(layer: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "ChromaSliderTrackLayer",
  "superClass": 52
},{
  "id": 35,
  "typeString": "protocol",
  "methods": [
    {
  "name": "shadeSliderChoseColor(_ slider: ChromaShadeSlider, color: UIColor)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ChromaShadeSliderDelegate"
},{
  "id": 36,
  "typeString": "class",
  "properties": [
    {
  "name": "var currentValue: CGFloat",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "let trackLayer",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "let handleView",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var handleWidth: CGFloat",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var handleCenterX: CGFloat",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var delegate: ChromaShadeSliderDelegate?",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var primaryColor",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var currentColor: UIColor",
  "type": "instance",
  "accessLevel": "open"
}
  ],
  "methods": [
    {
  "name": "commonInit()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "didMoveToSuperview()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "layoutLayerFrames()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "layoutHandleFrame()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "changeColorHue(to newColor: UIColor)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "updateGradientTrack(for color: UIColor)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "updateHandleLocation()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "endTracking(_ touch: UITouch?, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "doubleTapRecognized(_ recognizer: UITapGestureRecognizer)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "resetHandleToCenter()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "fittedValueInBounds(_ value: CGFloat) -> CGFloat",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "init(frame: CGRect)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "ChromaShadeSlider",
  "superClass": 53
},{
  "id": 38,
  "typeString": "protocol",
  "methods": [
    {
  "name": "colorPickerDidChooseColor(_ colorPicker: ChromaColorPicker, color: UIColor)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ChromaColorPickerDelegate"
},{
  "id": 39,
  "typeString": "enum",
  "cases": [
    {
  "name": "rainbow case grayscale"
}
  ],
  "name": "ColorSpace"
},{
  "id": 40,
  "typeString": "class",
  "properties": [
    {
  "name": "var hexLabel: UILabel!",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var shadeSlider: ChromaShadeSlider!",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var handleView: ChromaHandle!",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var handleLine: CAShapeLayer!",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var addButton: ChromaAddButton!",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var colorToggleButton: ColorModeToggleButton!",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var modeIsGrayscale: Bool",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var currentColor",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var supportsShadesOfGray: Bool",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var delegate: ChromaColorPickerDelegate?",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var currentAngle: Float",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var radius: CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stroke: CGFloat",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var padding: CGFloat",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var handleSize: CGSize",
  "type": "instance",
  "accessLevel": "open"
}
  ],
  "methods": [
    {
  "name": "commonInit()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "willMove(toSuperview newSuperview: UIView?)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "adjustToColor(_ color: UIColor)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "handleWasMoved(_ recognizer: UIPanGestureRecognizer)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "executeHandleShrinkAnimation()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "moveHandleTowardPoint(_ point: CGPoint)",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "addButtonPressed(_ sender: ChromaAddButton)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "sliderEditingDidEnd(_ sender: ChromaShadeSlider)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "draw(_ rect: CGRect)",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "drawCircleRing(in context: CGContext?, outerRadius: CGFloat, innerRadius: CGFloat, resolution: Float, colorSpace: ColorSpace)",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "layout()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "layoutAddButton()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "layoutHandle()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "layoutHandleLine()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "layoutHexLabel()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "layoutShadeSlider()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "layoutColorToggleButton()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateHexLabel()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateCurrentColor(_ color: UIColor)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "togglePickerColorMode()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "angleToCenterFromPoint(_ point: CGPoint) -> Float",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "colorOnWheelFromAngle(_ angle: Float) -> UIColor",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "angleForColor(_ color: UIColor) -> Float",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "positionOnWheelFromAngle(_ angle: Float) -> CGPoint",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "init(frame: CGRect)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "ChromaColorPicker",
  "superClass": 53,
  "containedEntities": [
    39
  ],
  "extensions": [
    41
  ]
},{
  "id": 42,
  "typeString": "enum",
  "cases": [
    {
  "name": "hue case grayscale"
}
  ],
  "name": "ColorState"
},{
  "id": 43,
  "typeString": "class",
  "properties": [
    {
  "name": "var colorState: ColorState",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var hueColorGradientLayer: CAGradientLayer",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let gradient",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let colorUpperLeft",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let colorLowerRight",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var grayColorGradientLayer: CAGradientLayer",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let gradient",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let gray",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let colorUpperLeft",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let colorLowerRight",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "commonInit()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "layoutSubviews()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "toggleState()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "layoutGradientLayer()",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "init(frame: CGRect)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "ColorModeToggleButton",
  "superClass": 54,
  "containedEntities": [
    42
  ]
},{
  "id": 44,
  "typeString": "class",
  "properties": [
    {
  "name": "var color",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var frame: CGRect",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var circleLayer",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var shadowOffset: CGSize?",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "let offset",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "layoutCircleLayer()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "init(frame: CGRect)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "ChromaHandle",
  "superClass": 55
},{
  "id": 45,
  "typeString": "class",
  "properties": [
    {
  "name": "var color",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "let layer",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var frame: CGRect",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var circleLayer: CAShapeLayer?",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "var plusIconLayer: CAShapeLayer? required",
  "type": "instance",
  "accessLevel": "open"
}
  ],
  "methods": [
    {
  "name": "createGraphics()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "layoutCircleLayer()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "layoutPlusIconLayer()",
  "type": "instance",
  "accessLevel": "open"
},
    {
  "name": "init(frame: CGRect)",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "init?(coder aDecoder: NSCoder)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "name": "ChromaAddButton",
  "superClass": 54
},{
  "id": 46,
  "typeString": "class",
  "methods": [
    {
  "name": "setUp()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tearDown()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testExample()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testPerformanceExample()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "NetworkDrawing4VEngineTests",
  "superClass": 56
},{
  "id": 47,
  "typeString": "class",
  "name": "UIViewController"
},{
  "id": 48,
  "typeString": "class",
  "name": "class"
},{
  "id": 49,
  "typeString": "class",
  "name": "UIImageView"
},{
  "id": 50,
  "typeString": "class",
  "name": "UIResponder"
},{
  "id": 51,
  "typeString": "protocol",
  "name": "UIApplicationDelegate"
},{
  "id": 52,
  "typeString": "class",
  "name": "CALayer"
},{
  "id": 53,
  "typeString": "class",
  "name": "UIControl"
},{
  "id": 54,
  "typeString": "class",
  "name": "UIButton"
},{
  "id": 55,
  "typeString": "class",
  "name": "UIView"
},{
  "id": 56,
  "typeString": "class",
  "name": "XCTestCase"
},{
  "id": 57,
  "typeString": "class",
  "name": "UIColor",
  "extensions": [
    37
  ]
},{
  "id": 9,
  "typeString": "extension",
  "methods": [
    {
  "name": "showInitial()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "close()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "removePresenter(for key: String)",
  "type": "instance",
  "accessLevel": "fileprivate"
}
  ],
  "protocols": [
    13
  ]
},{
  "id": 10,
  "typeString": "extension",
  "protocols": [
    5
  ]
},{
  "id": 11,
  "typeString": "extension",
  "methods": [
    {
  "name": "settingsCloseDidTap()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "openSettingsWith(settings:Settings)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    6
  ]
},{
  "id": 37,
  "typeString": "extension",
  "properties": [
    {
  "name": "var hexCode: String",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "let colorComponents",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "lighterColor(_ amount: CGFloat) -> UIColor",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "darkerColor(_ amount: CGFloat) -> UIColor",
  "type": "instance",
  "accessLevel": "public"
},
    {
  "name": "blendColors(color: UIColor, destinationColor: UIColor, amount : CGFloat) -> UIColor",
  "type": "type",
  "accessLevel": "public"
}
  ]
},{
  "id": 41,
  "typeString": "extension",
  "methods": [
    {
  "name": "shadeSliderChoseColor(_ slider: ChromaShadeSlider, color: UIColor)",
  "type": "instance",
  "accessLevel": "public"
}
  ],
  "protocols": [
    35
  ]
}]
;

var renderedEntities = [];

var useCentralNode = true;

var templates = {
  case: undefined,
  property: undefined,
  method: undefined,
  entity: undefined,
  data: undefined,

  setup: function() {
    this.case = document.getElementById("case").innerHTML;
    this.property = document.getElementById("property").innerHTML;
    this.method = document.getElementById("method").innerHTML;
    this.entity = document.getElementById("entity").innerHTML;
    this.data = document.getElementById("data").innerHTML;

    Mustache.parse(this.case)
    Mustache.parse(this.property);
    Mustache.parse(this.method);
    Mustache.parse(this.entity);
    Mustache.parse(this.data);
  }
}

var colorSuperClass = { color: "#848484", highlight: "#848484", hover: "#848484" }
var colorProtocol = { color: "#9a2a9e", highlight: "#9a2a9e", hover: "#9a2a9e" }
var colorExtension = { color: "#2a8e9e", highlight: "#2a8e9e", hover: "#2a8e9e" }
var colorContainedIn = { color: "#99AB22", highlight: "#99AB22", hover: "#99AB22" }
var centralNodeColor = "rgba(0,0,0,0)";
var centralEdgeLengthMultiplier = 1;
var network = undefined;

function bindValues() {
    templates.setup();

    for (var i = 0; i < entities.length; i++) {
        var entity = entities[i];
        var entityToBind = {
            "name": entity.name == undefined ? entity.typeString : entity.name,
            "type": entity.typeString,
            "props": renderTemplate(templates.property, entity.properties),
            "methods": renderTemplate(templates.method, entity.methods),
            "cases": renderTemplate(templates.case, entity.cases)
        };
        var rendered = Mustache.render(templates.entity, entityToBind);
        var txt = rendered;
        document.getElementById("entities").innerHTML += rendered;
    }

    setSize();
    setTimeout(startCreatingDiagram, 100);
}

function renderTemplate(template, list) {
    if (list != undefined && list.length > 0) {
        var result = "";
        for (var i = 0; i < list.length; i++) {
            var temp = Mustache.render(template, list[i]);
            result += temp;
        }
        return result;
    }
    return undefined;
}

function getElementSizes() {
  var strings = [];
  var elements = $("img");

  for (var i = 0; i < elements.length; i++) {
      var element = elements[i];
      
      var elementData = {
        width: element.offsetWidth,
        height: element.offsetHeight
      };
      strings.push(elementData);
  }
  return strings;
}

function renderEntity(index) {
  if (index >= entities.length) {
    // create the diagram
    $("#entities").html("");
    setTimeout(createDiagram, 100);
    return;
  }
  html2canvas($(".entity")[index], {
    onrendered: function(canvas) {
      var data = canvas.toDataURL();
      renderedEntities.push(data);
      var img = Mustache.render(templates.data, {data: data}); 
      $(document.body).append(img);

      renderEntity(index + 1);
    }
  });
}

function startCreatingDiagram() {
  renderedEntities = [];
  renderEntity(0);
}

function createDiagram() {
  var entitySizes = getElementSizes();

  var nodes = [];
  var edges = [];

  var edgesToCentral = [];
  var maxEdgeLength = 0;
  for (var i = 0; i < entities.length; i++) {
    var entity = entities[i];
    var data = entitySizes[i];
    var length = Math.max(data.width, data.height) * 1.5;
    var hasDependencies = false;

    maxEdgeLength = Math.max(maxEdgeLength, length);

    nodes.push({id: entity.id, label: undefined, image: renderedEntities[i], shape: "image", shapeProperties: {useImageSize: true } });
    if (entity.superClass != undefined && entity.superClass > 0) {
      edges.push({from: entity.superClass, to: entity.id, length: length, color: colorSuperClass, label: "inherits", arrows: {from: true} });
      
      hasDependencies = true;
    }

    var extEdges = getEdges(entity.id, entity.extensions, length, "extends", colorExtension, {from: true});
    var proEdges = getEdges(entity.id, entity.protocols, length, "conforms to", colorProtocol, {to: true});
    var conEdges = getEdges(entity.id, entity.containedEntities, length, "contained in", colorContainedIn, {from: true});

    hasDependencies = hasDependencies && extEdges.length > 0 && proEdges.length > 0 && conEdges.length > 0;

    edges = edges.concat(extEdges);
    edges = edges.concat(proEdges);
    edges = edges.concat(conEdges);

    if (!hasDependencies && useCentralNode)
    {
      edgesToCentral.push({from: entity.id, to: -1, length: length * centralEdgeLengthMultiplier, color: centralNodeColor, arrows: {from: true} });
    }
  }

  if (edgesToCentral.length > 1) {
    edges = edges.concat(edgesToCentral);
    nodes.push({id: -1, label: undefined, shape: "circle", color: centralNodeColor });
  }

  var container = document.getElementById("classDiagram");
  var dataToShow = {
      nodes: nodes,
      edges: edges
  };
  var options = {
      "edges": { "smooth": false },
      "physics": {
        "barnesHut": {
          "gravitationalConstant": -7000,
          "springLength": maxEdgeLength,
          "avoidOverlap": 1
        }
      },
      //configure: true
  };
  network = new vis.Network(container, dataToShow, options);

  $("#entities").html("");
  $("img").remove();

  setTimeout(disablePhysics, 200);
}

function disablePhysics()
{
  var options = {
      "edges": { "smooth": false },
      "physics": { "enabled": false }
  };
  network.setOptions(options);
  $(".loading-overlay").fadeOut("fast");
}

function getEdges(entityId, arrayToBind, edgeLength, label, color, arrows) {
  var result = [];
  if (arrayToBind != undefined && arrayToBind.length > 0) {
      for (var i = 0; i < arrayToBind.length; i++) {
        result.push({from: entityId, to: arrayToBind[i], length: edgeLength, color: color, label: label, arrows: arrows });
      }
  }
  return result;   
}

function setSize() {
  var width = $(window).width();
  var height = $(window).height();

  $("#classDiagram").width(width - 5);
  $("#classDiagram").height(height - 5);
}