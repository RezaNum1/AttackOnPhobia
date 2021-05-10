//
//  StoryTwoViewController.swift
//  AttackOnPhobia
//
//  Created by Reza Harris on 30/04/21.
//

import UIKit

class StoryTwoViewController: UIViewController {
    
    @IBOutlet weak var storyTxt: UILabel!
    @IBOutlet weak var dialogueImage: UIImageView!
    @IBOutlet weak var dialogueImageTwo: UIImageView!
    @IBOutlet weak var dialogueTxt: UILabel!
    @IBOutlet weak var dialogueTxtTwo: UILabel!
    @IBOutlet weak var handImg: UIImageView!
    @IBOutlet weak var boyImg: UIImageView!
    @IBOutlet weak var continueBtn: UILabel!
    var timer = Timer()
    var counterTimer = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        storyTxt.alpha = 0.0
        dialogueImage.alpha = 0.0
        dialogueImageTwo.alpha = 0.0
        dialogueTxt.alpha = 0.0
        dialogueTxtTwo.alpha = 0.0
        handImg.alpha = 0.0
        boyImg.alpha = 0.0
        continueBtn.alpha = 0.0
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.view.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            self.counterTimer += 0.1
            if self.counterTimer == 0.1 {
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    self.storyTxt.alpha = 1
                })
            } else if self.counterTimer == 1.7000000000000004 {
                UIView.animate(withDuration: 0.6, animations: { () -> Void in
                    self.dialogueImage.alpha = 1
                    self.dialogueImageTwo.alpha = 1
                    self.dialogueTxt.alpha = 1
                    self.dialogueTxtTwo.alpha = 1
                    self.handImg.alpha = 1
                    self.boyImg.alpha = 1
                })
            } else if self.counterTimer == 6.399999999999993 {
                self.continueBtn.alpha = 1
                self.timer.invalidate()
                let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
                self.view.addGestureRecognizer(gesture)
            }
        }
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "story_3", sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
