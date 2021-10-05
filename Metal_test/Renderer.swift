//
//  Renderer.swift
//  Metal_test
//
//  Created by Motorica LLC on 05.10.2021.
//

import MetalKit

class Renderer: NSObject{
    let device: MTLDevice
    let commandQueue: MTLCommandQueue
    
    var scene: Scene?
    

    init(device: MTLDevice) {
        self.device = device
        commandQueue = device.makeCommandQueue()!
        super.init()
    }
//    private func buildPipelineState() {
//        let pipelineDescriptor = MTLRenderPipelineDescriptor()
//        pipelineDescriptor.vertexFunction = vertexFunction
//        pipelineDescriptor.fragmentFunction = fragmentFunction
//        pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
//
//        pipelineDescriptor.vertexDescriptor = vertexDescriptor
//
//        do {
//            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
//        } catch let error as NSError {
//            print("error: \(error.localizedDescription)")
//        }
//    }
}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }
    
    func draw(in view: MTKView) {
        guard  let drawable = view.currentDrawable,
               let descriptor = view.currentRenderPassDescriptor else { return }
        let commandBuffer = commandQueue.makeCommandBuffer()
        
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: descriptor)
        
        let deltaTime = 1 / Float(view.preferredFramesPerSecond)
        
        scene?.render(commandEncoder: commandEncoder,
                     deltaTime: deltaTime)
        
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}


