//
//  ViewController2.swift
//  aLIB
//
//  Created by Pavle Mijatovic on 6/1/16.
//  Copyright © 2016 Pavle Mijatovic. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController2: UIViewController {




  @IBAction func vc2Test(sender: UIButton) {
    
    let audioEngine = AVAudioEngine()
    
    let inputNode = audioEngine.inputNode
    let sampleCount = 2048
    let bus = 0
    var samplesAsDoubles = Array(count: Int(sampleCount), repeatedValue: CDouble())
    let frameLength = UInt32(sampleCount) // This seems to be ignored when passed into the AudioTap, therefore reassign within block.
    inputNode!.installTapOnBus(0, bufferSize:frameLength, format: inputNode!.inputFormatForBus(bus), block: { (
      buffer: AVAudioPCMBuffer!,
      audioTime  : AVAudioTime!) in
      
      // Change incomming buffer size
      buffer.frameLength = UInt32(sampleCount)
      
      // Populate array with incomming audio samples
      for var i = 0; i < Int(buffer.frameLength); i++
      {
        samplesAsDoubles[i] = Double(buffer.floatChannelData.memory[i])
        
      }
      //Probably the Groeztel function needs to be called from somewhere here
    })
    
    
  }

}
