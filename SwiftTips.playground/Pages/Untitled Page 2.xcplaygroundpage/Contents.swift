//: [Previous](@previous)

import UIKit

class NotificationManager {
    
    var observerTokens = [AnyObject]()
    
    deinit {
    	deregisterAll()
    }
    
    func registerObserver(name: String!, forObject object: AnyObject!, block: (NSNotification! -> Void)) {
        let token = NSNotificationCenter.defaultCenter().addObserverForName(name, object: object, queue: nil){note in block(note)}
        observerTokens.append(token)
    }
    func registerObserver(name: String!, block: (NSNotification! -> Void)) {
        let token = NSNotificationCenter.defaultCenter().addObserverForName(name, object: nil, queue: nil) {note in block(note)}
        observerTokens.append(token)
    }
    
    func deregisterAll() {
        for token in observerTokens {
            NSNotificationCenter.defaultCenter().removeObserver(token)
        }
        observerTokens = []
    }
}




class VC: UIViewController{
	
	private let notificatonManager = NotificationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificatonManager.registerObserver("testNotfication") { (note) -> Void in
            
        }
    }
    
    
    

}


let vc = VC()

vc.notificatonManager.observerTokens




