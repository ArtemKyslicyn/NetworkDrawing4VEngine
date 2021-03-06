//
//  Settings.swift
//  NetworkDrawing4VEngine
//
//  Created by Artem Kislitsyn on 28.08.2018.
//  Copyright © 2018 FreeIPA Mobile. All rights reserved.
//
import Foundation
import Network
import UIKit


class NetworkClientClient {
    var connection: NWConnection
    var queue: DispatchQueue
    weak var controller: UIViewController!
	
	convenience init() {
		self.init(usingQueue: DispatchQueue(label: "client"))
	}
	
	init(usingQueue queue: DispatchQueue) {
		
		self.queue = queue
		
		//        connection = NWConnection(host: "10.42.72.5", port: NetworkPort, using: NetworkParameters)
		connection = NWConnection(to: NWEndpoint.service(name: NetworkServiceName, type: NetworkServiceType, domain: "local", interface: nil), using: NetworkParameters)
		
		connection.stateUpdateHandler = { state in
			switch state {
			case .ready:
				print("client ready")
			case .failed(let error):
				print("client failed: \(error)")
			default:
				break
			}
		}
		
		connection.start(queue: queue)
	}
	
    init(withViewController controller: UIViewController, usingQueue queue: DispatchQueue) {
        self.controller = controller
        self.queue = queue
        
//        connection = NWConnection(host: "10.42.72.5", port: NetworkPort, using: NetworkParameters)
        connection = NWConnection(to: NWEndpoint.service(name: NetworkServiceName, type: NetworkServiceType, domain: "local", interface: nil), using: NetworkParameters)
        
        connection.stateUpdateHandler = { state in
            switch state {
            case .ready:
                print("client ready")
            case .failed(let error):
                print("client failed: \(error)")
            default:
                break
            }
        }
        
        connection.start(queue: queue)
    }
    
    func send(frame: Data) {
        
        if (connection.state != .ready){
            return;
        }
        
        var frames = [Data]()
        
        let preferredChunkSize = NetworkFrameSize
        let totalSize = frame.count
        var offset = 0
        
        frame.withUnsafeBytes { (u8Ptr: UnsafePointer<UInt8>) in
            let mutRawPointer = UnsafeMutableRawPointer(mutating: u8Ptr)
            
            while offset < totalSize {
                
                let chunkSize = (totalSize - offset) >= preferredChunkSize ? preferredChunkSize : totalSize - offset
                let chunk = Data(bytesNoCopy: mutRawPointer + offset, count: chunkSize, deallocator: Data.Deallocator.none)
                offset += chunkSize
                
                frames.append(chunk)
            }
        }
        
        self.send(frames: frames, uisngConnection: connection)
    }
    
    func send(frames: [Data], uisngConnection connection: NWConnection) {
         connection.batch {
            for frame in frames {
                connection.send(content: frame, completion: .contentProcessed({ error in
                    if let error = error {
                        print("error while sending: \(error)")
                    }
                }))
            }
        }
    }
    
}
