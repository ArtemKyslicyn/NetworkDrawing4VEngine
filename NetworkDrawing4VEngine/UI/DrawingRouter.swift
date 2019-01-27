//
//  UsersRouter.swift
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

// Delegate used to close the user details
protocol DrawBoardNavigationDelegate: class {
	func openSettingsWith(settings:Settings)
	func closeSettingsWith(settings:Settings)
}

protocol SettingsNavigationDelegate: class {
	func openSettingsWith(settings:Settings)
	func settingsCloseDidTap()
}

protocol BoardDrawNavigationDelegate: class {
	func settingsCloseDidTap()
}

final class DrawingRouter {

	// Parent view controller to add the components
    fileprivate let parentViewController: UIViewController

	// Dictionary of presenters used
    fileprivate var presenters = [String: ViewPresenter]()
	
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
}

extension DrawingRouter: Router {
	// Shows first component, the users list
	func showInitial() {
		let usersListPresenter = DrawBoardViewPresenter(settings: Settings(), navigationDelegate: self)
		usersListPresenter.present(in: parentViewController)

		presenters["DrawBoard"] = usersListPresenter
	}

	// Closes the router removing all its components
	func close() {
		presenters.keys.forEach { [unowned self] in
			self.removePresenter(for: $0)
		}
	}

	fileprivate func removePresenter(for key: String) {
		let userDetailsPresenter = presenters[key]
		userDetailsPresenter?.remove()

		presenters[key] = nil
	}
}

extension DrawingRouter: DrawBoardNavigationDelegate {
	func closeSettingsWith(settings: Settings) {
		
		let usersListPresenter = presenters["DrawBoard"]
		//usersListPresenter?.
		
		presenters["DrawBoard"] = usersListPresenter
	}
	

}

extension DrawingRouter: SettingsNavigationDelegate {

	func settingsCloseDidTap(settings: Settings) {
		removePresenter(for: "Settings")
	}
	
	func settingsCloseDidTap() {
		removePresenter(for: "Settings")
	}
	
	func openSettingsWith(settings:Settings)
	{
		
		let userDetailsPresenter = SettingDetailsViewPresenter(settings: settings, navigationDelegate: self)
		userDetailsPresenter.present(in: parentViewController)
		presenters["Settings"] = userDetailsPresenter
	}

}
