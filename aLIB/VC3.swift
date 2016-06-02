//
//  VC3.swift
//  aLIB
//
//  Created by Pavle Mijatovic on 6/2/16.
//  Copyright © 2016 Pavle Mijatovic. All rights reserved.
//

import UIKit
import AVFoundation

class VC3: UIViewController {
  
  private var audioEngine = AVAudioEngine()
  
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  
  
  @IBAction func vc3Action(sender: UIButton) {
    
    startRecording()
  }
  
  
  
  func startRecording() {
    
    
    // Setup engine and node instances
    let engine = AVAudioEngine()
    let delay = AVAudioUnitDelay()
    let input = engine.inputNode
    let output = engine.outputNode
    let format = input!.inputFormatForBus(0)
    var error:NSError?
    
    // Attach FX nodes to engine
    engine.attachNode(delay)
    
    // Connect nodes
    engine.connect(input!, to: delay, format: format)
    engine.connect(delay, to: output, format: format)
    
    // Start engine
    try! engine.start()
    
    let length = 256
    let audioBuffer = AVAudioPCMBuffer(PCMFormat: input!.outputFormatForBus(0), frameCapacity: UInt32(length))
    audioBuffer.frameLength = UInt32(length)
    
    input!.installTapOnBus(0, bufferSize:UInt32(length), format: input!.outputFormatForBus(0), block:
      {
        (buffer, time) in
        
        var sum:Float = 0
        
        // do a quick calc from the buffer values
        for (var i=0; i<length; i++)
        {
          sum += Float(buffer.floatChannelData.memory[i]) * 10_000
        }
        
        print(NSString(format:"%.0f",sum/Float(length)))
    })
    
    
    while (true)
    {
      NSThread.sleepForTimeInterval(1)
    }
    
    
    
    
    
  }

    
    
    
    
    
    
    
}
  

  
  



