//
//  UserDetailsViewController.swift
//
//  4VEngine
//
//  Copyright (c) 2017 Marco Santarossa (https://marcosantadev.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet private weak var userNameLabel: UILabel!
    
    private unowned let viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //userNameLabel.text = viewModel.userName
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        viewModel.closeButtonDidTap()
    }
	
	var color:UIColor = UIColor.black
	var brushSize:CGFloat = 5.0
	var opacityValue:CGFloat = 1.0
	var timeInterval:Double = 15
	var delegate:SettingsViewControllerDelegate?
	var onlyStylus:Bool = true
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// ColorPicker object used to set the color. Has methods to read and set the color
		neatColorPicker.delegate = self as? ChromaColorPickerDelegate //ChromaColorPickerDelegate
		neatColorPicker.padding = 5
		neatColorPicker.stroke = 3
		neatColorPicker.hexLabel.textColor = UIColor.black
		neatColorPicker.adjustToColor(color)
		
		drawPreview(color: color)
		timerSlider.value = Float(timeInterval)
		
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
		
		color = neatColorPicker.currentColor
		drawPreview(color: neatColorPicker.currentColor)
	}
	
	@IBAction func timerChanged(_ sender: Any) {
		timeInterval = Double(timerSlider.value)
		timerLabel.text = "Timer " + "\(timeInterval)"
	}
	/**
	brushSizeChanged is an action method invoked when the value of brushSizeSlider is changed
	- parameters:
	- sender: The brushSizeSlider object that invokes this method on change
	*/
	@IBAction func brushSizeChanged(_ sender: Any) {
		
		brushSize = CGFloat(brushSizeSlider.value * 50)
		drawPreview(color: neatColorPicker.currentColor)
	}
	
	/**
	opacityChanged is an action method invoked when the value of opacitySlider is changed
	- parameters:
	- sender: The opacityslider object that invokes this method on change
	*/
	@IBAction func opacityChanged(_ sender: Any) {
		
		opacityValue = CGFloat(opacitySlider.value)
		drawPreview(color: neatColorPicker.currentColor)
		
	}
	
	/**
	settingsSelected is an action method invoked when Done button is pressed.
	This method invokes the delegate method of settingsVewController if set
	- parameters:
	- sender: The UIButton object that invokes this method on press
	*/
	@IBAction func settingsSelected(_ sender: Any) {
		self.onlyStylus = self.stylusSwitch.isOn
		if delegate != nil {
			delegate?.settingsViewControllerDidFinish(self)
		}
		
		dismiss(animated: true, completion: nil)
		
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
		
		context!.setFillColor(color.withAlphaComponent(opacityValue).cgColor)
		context!.fillEllipse(in: CGRect(x: 0, y: 0, width: brushSize, height: brushSize))
		
		brushView.image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
}
