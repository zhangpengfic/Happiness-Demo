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
//            print("happiness = \(happiness)")
            faceView?.setNeedsDisplay()
            title="\(happiness)"
        }
    }
    //protocel
    func smilinessForFaceView(sender: FaceView) -> Double {
        return Double(happiness-50)/50.0
    }
    
    func className() -> String {
        return "HappinessViewController"
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("\(className()):init\(aDecoder)")
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("\(className()):init\(nibNameOrNil,nibBundleOrNil)")
    }
    
    deinit {
        print("\(className()):deinit")
    }
    
    override func awakeFromNib() {
        print("\(className()):awakeFromNib")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(className()):viewDidLoad")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("\(className()):viewWillAppear (animated = \(animated))")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("\(className()):viewDidAppear (animated = \(animated))")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(className()):viewWillDisappear  (animated = \(animated))")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(className()):viewDidDisappear  (animated = \(animated))")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("\(className()):viewWillLayoutSubviews() bounds.size\(view.bounds.size)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("\(className()):viewDidLayoutSubviews() bounds.size\(view.bounds.size)")
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        print("\(className()):viewWillTransitionToSize")
        
        coordinator.animateAlongsideTransition({ (UIViewControllerTransitionCoordinatorContext) in
            print("\(self.className()):animateAlongsideTransition")
            
        }) { (UIViewControllerTransitionCoordinatorContext) in
            print("\(self.className()):doneAnimateAlongsideTransition")
            
        }
    }
    
    
}
