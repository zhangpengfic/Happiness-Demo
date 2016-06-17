//
//  HappinessViewController.swift
//  Happiness-Demo
//
//  Created by Alfred on 16/6/12.
//  Copyright © 2016年 WanXunAlfred. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController,FaceViewDataSource {
//protocel
    
    @IBOutlet weak var faceView: FaceView!
        {
        didSet{
            faceView.dataSource=self//protocol
            faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(changeHappiness(_:))))
//            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: #selector(faceView.scale(_:))))
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    
    func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    var happiness : Int = 50{
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            faceView.setNeedsDisplay()
        }
    }
    //protocel
    func smilinessForFaceView(sender: FaceView) -> Double {
        return Double(happiness-50)/50.0
    }
    
}
