//
//  EventMonitor.swift
//  Quotes
//
//  Created by Edward Tang on 12/30/20.
//  Copyright © 2020 Edward Tang. All rights reserved.
//

import Foundation
import Cocoa

public class EventMonitor {
    private var monitor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void
    
    public init(mask: NSEvent.EventTypeMask, handler: @escaping(NSEvent?) -> Void){
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    public func start(){
        self.monitor = NSEvent.addGlobalMonitorForEvents(matching: self.mask, handler: self.handler)
    }
    
    public func stop(){
        if monitor != nil {
            NSEvent.removeMonitor(self.monitor!)
            monitor = nil
        }
    }
    
}
