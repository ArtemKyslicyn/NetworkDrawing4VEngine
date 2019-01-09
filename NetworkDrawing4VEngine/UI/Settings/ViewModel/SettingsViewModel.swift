//
//  DrawBoardViewModel.swift
//
//  4VEngine
//
//  Copyright (c) 2017 Marco Santarossa (https://marcosantadev.com)


final class SettingsViewModel {
    
    //var userName: String
	public var settings:Settings!
    private weak var navigationDelegate: SettingsNavigationDelegate?
    
    init(settings: Settings, navigationDelegate: SettingsNavigationDelegate) {
        self.navigationDelegate = navigationDelegate
		self.settings = settings
		
    }
    
    func closeButtonDidTap() {
		navigationDelegate?.settingsCloseDidTap()
    }
}
