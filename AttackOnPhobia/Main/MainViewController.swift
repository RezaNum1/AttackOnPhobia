//
//  MainViewController.swift
//  AttackOnPhobia
//
//  Created by Reza Harris on 29/04/21.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    var backgroundMusic: AVAudioPlayer?

    @IBOutlet weak var monsterImg: UIImageView!
    @IBOutlet weak var startBtn: UIButton!
    @IBAction func startBtnPressed(_ sender: Any) {
        backgroundMusic?.stop()
        self.performSegue(withIdentifier: "story_1", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
        startBtn.layer.cornerRadius = 8
        startBtn.layer.shadowColor = UIColor.black.cgColor
        startBtn.layer.shadowOpacity = 2
        startBtn.layer.masksToBounds = false
        startBtn.layer.shadowOffset = CGSize(width: 3.5, height: 3.5)
        startBtn.layer.shadowRadius = 2
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hoveringEffect()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func hoveringEffect() {
        let hover = CABasicAnimation(keyPath: "position")
        hover.isAdditive = true
        hover.fromValue = NSValue(cgPoint: CGPoint(x: 0, y: -20.0))
        hover.toValue = NSValue(cgPoint: CGPoint(x: 0, y: 20.0))
        hover.autoreverses = true
        hover.duration = 2
        hover.speed = 2
        hover.repeatCount = Float.infinity
        
        monsterImg.layer.add(hover, forKey: "myHoverAnimation")
    }
    
    // AVFoundation
    func playMusic() {
        guard let path = Bundle.main.path(forResource: "MainBacksound", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)        
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: url)
            backgroundMusic?.play()
        } catch {
            
        }
    }
}
