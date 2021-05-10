//
//  StoryFourViewController.swift
//  AttackOnPhobia
//
//  Created by Reza Harris on 30/04/21.
//

import UIKit

class StoryFourViewController: UIViewController {

    @IBOutlet weak var monsterMe: UIImageView!
    @IBOutlet weak var storyTxt: UILabel!
    @IBOutlet weak var continueTxt: UILabel!
    var timer = Timer()
    var counterTimer = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        monsterMe.alpha = 0.0
        storyTxt.alpha = 0.0
        continueTxt.alpha = 0.0
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            self.counterTimer += 0.1
            if self.counterTimer == 0.1 {
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    self.monsterMe.alpha = 1
                    self.storyTxt.alpha = 1
                })
            } else if self.counterTimer == 1.9000000000000006 {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    self.continueTxt.alpha = 1
                })
                self.timer.invalidate()
                let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
                self.view.addGestureRecognizer(gesture)
            }
        }
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "story_5", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
