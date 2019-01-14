//
//  DrawBoardViewPresenter.swift
//
//  4VEngine
//

import UIKit

final class SettingDetailsViewPresenter: ViewPresenter {
    
    private let viewFactory: SettingsViewFactory
    
    /// Description
    ///
    /// - Parameters:
    ///   - settings: settings description
    ///   - navigationDelegate: navigationDelegate description
    init(settings: Settings, navigationDelegate: SettingsNavigationDelegate) {
		viewFactory = SettingsViewFactory(settings: settings, navigationDelegate: navigationDelegate)
    }
    
    /// Description
    ///
    /// - Parameter parentViewController: parentViewController description
    func present(in parentViewController: UIViewController) {
        parentViewController.addFillerChildViewController(viewFactory.viewController)
    }
    
    func remove() {
        viewFactory.viewController.view.removeFromSuperview()
		viewFactory.viewController.removeFromParent()
    }
}
