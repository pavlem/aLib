//
//  ViewController.swift
//  aLIB
//
//  Created by Pavle Mijatovic on 6/1/16.
//  Copyright © 2016 Pavle Mijatovic. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
  
  
  let audioEngine  = AVAudioEngine()
  
  
  
  override func loadView() {
    super.loadView()
    

    
  }
  
  
  
  @IBAction func test(sender: UIButton) {
    let inputNode = audioEngine.inputNode
    let bus = 0
    inputNode!.installTapOnBus(bus, bufferSize: 2048, format: inputNode!.inputFormatForBus(bus)) {
      (buffer: AVAudioPCMBuffer!, time: AVAudioTime!) -> Void in
      
      
      let firstChannel = buffer.floatChannelData[0]
      

      
      
      let arr = Array(UnsafeBufferPointer(start: firstChannel, count: Int(buffer.frameLength)))
      
      
      

//      print(arr)
      print(buffer.floatChannelData)
      print("")

//      print(buffer.floatChannelData[50])
    }
    
    audioEngine.prepare()
    do{
      try audioEngine.start()
    }catch{
      
      print("Error")
      
    }
    
  }
}



//let firstChannel = buffer.floatChannelData[0]
//let arr = Array(UnsafeBufferPointer(start: firstChannel, count: Int(buffer.frameLength)))
//// Do something with your array of Floats