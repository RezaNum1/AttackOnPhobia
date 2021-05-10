//
//  StorySixViewController.swift
//  AttackOnPhobia
//
//  Created by Reza Harris on 30/04/21.
//

import UIKit
import AVFoundation

class StorySixViewController: UIViewController {
    
    @IBOutlet weak var storyTxt: UILabel!
    @IBOutlet weak var continueTxt: UILabel!
    
    var audioPlayer : AVAudioPlayer? {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.audioPlayer
        }
        set {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.audioPlayer = newValue
        }
    }
    
    var timer = Timer()
    var startingTimer = Timer()
    var counterTimer = 0.0
    var startingCounterTimer = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        storyTxt.alpha = 0.0
        continueTxt.alpha = 0.0
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            self.counterTimer += 0.1
            if self.counterTimer == 0.1 {
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
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
        continueTxt.isHidden = true
        startingTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            self.startingCounterTimer += 0.1
            
            if self.startingCounterTimer == 0.30000000000000004 {
                self.storyTxt.text = "3"
                self.storyTxt.font = self.storyTxt.font.withSize(150)
            } else if self.startingCounterTimer == 2.0000000000000004 {
                self.audioPlayer?.setVolume(0, fadeDuration: 2)
                self.storyTxt.text = "2"
            } else if self.startingCounterTimer == 3.0000000000000013 {
                self.storyTxt.text = "1"
            } else if self.startingCounterTimer == 4.000000000000002 {
                self.performSegue(withIdentifier: "fightingPage", sender: self)
            }
            
        }
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
