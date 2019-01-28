//
//  DrawBoardViewController.swift
//
//  4VEngine
//


import UIKit
import ChromaColorPicker

class SettingsViewController: UIViewController {

	@IBOutlet weak var timerLabel: UILabel!
	@IBOutlet weak var neatColorPicker: ChromaColorPicker!
	@IBOutlet weak var timerSlider: UISlider!
	@IBOutlet weak var brushSlider: UISlider!
	@IBOutlet weak var opacitySlider: UISlider!
	@IBOutlet weak var stylusSwitch: UISwitch!
	@IBOutlet weak var brushView: UIImageView!
	
	var color:UIColor = UIColor.black
	var brushSize:CGFloat = 5.0
	var opacityValue:CGFloat = 1.0
	var timeInterval:Double = 15
	//var delegate:SettingsViewControllerDelegate?
	var onlyStylus:Bool = true
    private  let viewModel: SettingsViewModel
	
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
		
        super.init(nibName: "SettingsViewController", bundle: nil)
    }
	
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	
	
    @IBAction func onCloseButton(_ sender: Any) {
        viewModel.closeButtonDidTap(settings: self.viewModel.settings)
    }
	
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// ColorPicker object used to set the color. Has methods to read and set the color
		neatColorPicker.delegate = self as? ChromaColorPickerDelegate 
		neatColorPicker.padding = 5
		neatColorPicker.stroke = 3
		neatColorPicker.hexLabel.textColor = UIColor.black
		neatColorPicker.adjustToColor(self.viewModel.settings.color)
		
		drawPreview(color: self.viewModel.settings.color)
		timerSlider.value = Float(self.viewModel.settings.timeInterval)
		
		// Do any additional setup after loading the view.
	}
	
	@IBAction func stylusValueChanged(_ sender: UISwitch) {
		sender.isOn = !sender.isOn
	}
	/**
	colorChanged is an action method invoked when the value of colorPicker is changed
	- parameters:
	- sender: The colorPicker object that invokes this method on change
	*/
	@IBAction func colorChanged(_ sender: Any) {
		
	   self.viewModel.settings.color = neatColorPicker.currentColor
//		color = neatColorPicker.currentColor
		drawPreview(color: self.viewModel.settings.color)
	}
	
	@IBAction func timerChanged(_ sender: Any) {
		self.viewModel.settings.timeInterval = Double(timerSlider.value)
		timerLabel.text = "\(self.viewModel.settings.timeInterval)"
	}
	/**
	brushSizeChanged is an action method invoked when the value of brushSizeSlider is changed
	- parameters:
	- sender: The brushSizeSlider object that invokes this method on change
	*/
	@IBAction func brushSizeChanged(_ sender: Any) {
		
		self.viewModel.settings.brushSize = CGFloat(brushSlider.value * 50)
		drawPreview(color: neatColorPicker.currentColor)
	}
	
	/**
	opacityChanged is an action method invoked when the value of opacitySlider is changed
	- parameters:
	- sender: The opacityslider object that invokes this method on change
	*/
	@IBAction func opacityChanged(_ sender: Any) {
		
		self.viewModel.settings.opacityValue = CGFloat(self.opacitySlider.value)
		drawPreview(color: neatColorPicker.currentColor)
		
	}
	
	/**
	settingsSelected is an action method invoked when Done button is pressed.
	This method invokes the delegate method of settingsVewController if set
	- parameters:
	- sender: The UIButton object that invokes this method on press
	*/
	@IBAction func settingsSelected(_ sender: Any) {
		self.viewModel.settings.onlyStylus = self.stylusSwitch.isOn
		//self.viewModel.settings.brushSize = CGFloat(brushSlider.value * 50)
		//self.viewModel.settings.color = neatColorPicker.currentColor

		self.viewModel.closeButtonDidTap(settings: self.viewModel.settings)
		
	}
	
	/**
	drawPreview is a method to draw the preview of the brush settings.
	brushSize and opacity values are used to render a circle which indicates brushSize and opacity.
	- parameters:
	- color: The current color of the colorPicker
	*/
	func drawPreview (color:UIColor) {
		UIGraphicsBeginImageContext(brushView.frame.size)
		let context = UIGraphicsGetCurrentContext()

		context!.setFillColor(color.withAlphaComponent(self.viewModel.settings.opacityValue).cgColor)
		context!.fillEllipse(in: CGRect(x: 0, y: 0, width: self.viewModel.settings.brushSize, height: self.viewModel.settings.brushSize))

		brushView.image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
