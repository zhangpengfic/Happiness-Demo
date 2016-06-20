//
//  PsychologistViewController.swift
//  Happiness-Demo
//
//  Created by Alfred on 16/6/20.
//  Copyright © 2016年 WanXunAlfred. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    @IBAction func starsAction(sender: UIButton) {
        performSegueWithIdentifier("Almost happy", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as UIViewController
        if let navigationController = destination as? UINavigationController{
            destination = navigationController.visibleViewController!
        }
        
        if let hvc = destination as? HappinessViewController{
            if let id = segue.identifier{
                switch(id){
                case "Sad": hvc.happiness = 11
                case "Meh": hvc.happiness = 55
                case "Almost happy": hvc.happiness = 75
                case "Happy": hvc.happiness = 99
                default: hvc.happiness = 50
                }
            }
        }
    }
    
    func className() -> String {
        return "PsychologistViewController"
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
