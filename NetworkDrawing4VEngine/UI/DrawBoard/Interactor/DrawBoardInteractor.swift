//
//  DrawBoardInteractor.swift
//  NetworkDrawing4VEngine
//
//  Created by Artem Kislitsyn on 01.09.2018.
//  Copyright © 2018 FreeIPA Mobile. All rights reserved.
//

import UIKit

class DrawBoardInteractor {
	
	private  let networkingClinet:NetworkClientClient = NetworkClientClient()
	private  let networkingServer:NetworkServer =  NetworkServer()
	private  let figureConverter:FigureConverter = FigureConverter()
	
	func sendFigure(figure:Figure)  {
		
		let dataFigure = figureConverter.convertFigureToData(figure: figure)
		networkingClinet.send(frame: dataFigure)
	}
	
	

}
