//
//  ViewController.swift
//  Metal_test
//
//  Created by Motorica LLC on 05.10.2021.
//

import UIKit
import MetalKit

enum Colors {
    static let wenderlichGreen = MTLClearColor(red: 0.0,
                                               green: 0.4,
                                               blue: 0.21,
                                               alpha: 1.0)
}

class ViewController: UIViewController {
    
    var metalView: MTKView {
        return view as! MTKView
    }
    
    var renderer: Renderer?
//    var device_my: MTLDevice!
//    var commandQueue: MTLCommandQueue!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metalView.device = MTLCreateSystemDefaultDevice()
        guard let device = metalView.device else {
            fatalError("Device not created. Run on a physical device")
        }
        
        metalView.clearColor = Colors.wenderlichGreen
        renderer = Renderer(device: device)
//        renderer?.scene = GameScen(device: device, size: view.bounds.size)
        metalView.delegate = renderer
    }
}
