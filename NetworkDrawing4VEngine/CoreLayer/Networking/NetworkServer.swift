//
//  LiveStreamingServer.swift
//  NetworkDrawing4VEngine
//
//  Created by Artem Kislitsyn on 28.08.2018.
//  Copyright © 2018 FreeIPA Mobile. All rights reserved.
//

import Foundation
import Network
import UIKit


class NetworkServer {
    
    var listener: NWListener
    var queue: DispatchQueue
    weak var controller: UIViewController!
    var frame = Data()
	
	convenience init() {
		self.init(usingQueue: DispatchQueue(label: "server"))
	}
	
	init(usingQueue queue: DispatchQueue) {
		
		self.queue = queue
		
		listener = try! NWListener(using: NetworkParameters, on: NetworkPort)
		listener.service = NWListener.Service(name: NetworkServiceName, type: NetworkServiceType)
		listener.serviceRegistrationUpdateHandler = { serviceChange in
			switch serviceChange {
			case .add(let endpoint):
				switch endpoint {
				case .service(let name, _, _, _):
					print("listening \(name)")
				default:
					break;
				}
			default:
				break;
			}
		}
		
		listener.newConnectionHandler = { [weak self] newConnection in
			if let strongSelf = self {
				print("new connection")
				newConnection.start(queue: strongSelf.queue)
				strongSelf.recieve(on: newConnection)
			}
		}
		
		listener.stateUpdateHandler = { [weak self] state in
			switch state {
			case .ready:
				print("listening on port \(String(describing: self?.listener.port))")
			case .failed(let error):
				print("failed with error: \(error)")
			default:
				break
			}
		}
		
		listener.start(queue: queue)
	}
	
    init(withViewController controller: UIViewController, usingQueue queue: DispatchQueue) {
        self.controller = controller
        self.queue = queue
        
		listener = try! NWListener(using: NetworkParameters, on: NetworkPort)
        listener.service = NWListener.Service(name: NetworkServiceName, type: NetworkServiceType)
        listener.serviceRegistrationUpdateHandler = { serviceChange in
            switch serviceChange {
            case .add(let endpoint):
                switch endpoint {
                case .service(let name, _, _, _):
                    print("listening \(name)")
                default:
                    break;
                }
            default:
                break;
            }
        }
        
        listener.newConnectionHandler = { [weak self] newConnection in
            if let strongSelf = self {
                print("new connection")
                newConnection.start(queue: strongSelf.queue)
                strongSelf.recieve(on: newConnection)
            }
        }
        
        listener.stateUpdateHandler = { [weak self] state in
            switch state {
            case .ready:
                print("listening on port \(String(describing: self?.listener.port))")
            case .failed(let error):
                print("failed with error: \(error)")
            default:
                break
            }
        }
        
        listener.start(queue: queue)
    }
    
    func recieve(on connection: NWConnection) {
        connection.batch {
            connection.receive(minimumIncompleteLength: 1, maximumLength: NetworkFrameSize) { (content, context, isComplete, error) in
                if let frame = content {
                    
                    self.frame.append(frame)
                    
                    if (frame.count < NetworkFrameSize) {
                        //self.controller.recieved(frame: self.frame)
                        self.frame = Data()
                    }

                    if error == nil {
                        self.recieve(on: connection)
                    }
                }
            }
        }
    }
    
    
    
}
