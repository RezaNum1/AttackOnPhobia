//
//  FightingPageViewController.swift
//  AttackOnPhobia
//
//  Created by Reza Harris on 01/05/21.
//

import UIKit
import AVFoundation

enum EndingStatus: String {
    case win
    case lose
}

class FightingPageViewController: UIViewController {
    
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
    
    var effectPlayer : AVAudioPlayer? {
        get {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.effectPlayer
        }
        set {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.effectPlayer = newValue
        }
    }

    @IBOutlet weak var supportLbl: UILabel!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var fightingProgress: UIProgressView!
    @IBOutlet weak var fightingHand: UIImageView!
    @IBOutlet weak var monsterImg: UIImageView!
    @IBOutlet weak var sliderView: CustomSlider!
    @IBOutlet weak var onFireImg: UIImageView!
    
    var xPositionImage = 5
    var yPositionImage = 60
    var imageSize = 384
    var imageName = "HandBar"
    
    
    var timerStatus = false
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        onFireImg.isHidden = true
        sliderView.value = 0.3
        playMusic()
        playEffect()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        preparation()
        hoveringEffect()
    }
    
    override func viewDidLayoutSubviews() {
        self.sliderView.setThumbImage(UIImage(named: "HandBar"), for: .normal)
    }
    
    @IBAction func rightBtnPressed(_ sender: Any) {
        if !timerStatus {
            monsterAct()
            timerStatus = true
        }
        
        if sliderView.value == 1.0 {
            timer.invalidate()
            self.performSegue(withIdentifier: "ending", sender: EndingStatus.win)
        }
        
        sliderView.value += 0.01
        
    }
    
    @IBAction func leftBtnPressed(_ sender: Any) {
        if !timerStatus {
            monsterAct()
            timerStatus = true
        }
        if sliderView.value == 1.0 {
            timer.invalidate()
            self.performSegue(withIdentifier: "ending", sender: EndingStatus.win)
        }
        
        sliderView.value += 0.01
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func monsterAct() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { time in
            
            self.sliderView.value -= 0.015
            
            if self.sliderView.value == 0.0 {
                self.timer.invalidate()
                self.performSegue(withIdentifier: "ending", sender: EndingStatus.lose)
            }
            
            if self.sliderView.value > 0.65 {
                self.onFireImg.isHidden = false
                self.sliderView.setThumbImage(UIImage(named: "ThumbFire"), for: .normal)
            }
            else {
                self.onFireImg.isHidden = true
                self.sliderView.setThumbImage(UIImage(named: "HandBar"), for: .normal)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let endingVC = segue.destination as? EndingViewController else { return }
        guard let status = sender as? EndingStatus else { return }
        endingVC.endingStatus = status
    }
    
    func preparation(){
        rightBtn.layer.cornerRadius = 8
        rightBtn.layer.shadowColor = UIColor.gray.cgColor
        rightBtn.layer.shadowOpacity = 2
        rightBtn.layer.masksToBounds = false
        rightBtn.layer.shadowOffset = CGSize(width: 3.5, height: 3.5)
        rightBtn.layer.shadowRadius = 2
        
        leftBtn.layer.cornerRadius = 8
        leftBtn.layer.shadowColor = UIColor.gray.cgColor
        leftBtn.layer.shadowOpacity = 2
        leftBtn.layer.masksToBounds = false
        leftBtn.layer.shadowOffset = CGSize(width: -3.5, height: 3.5)
        leftBtn.layer.shadowRadius = 2
        
        monsterImg.frame = CGRect(x: xPositionImage, y: yPositionImage, width: imageSize, height: imageSize)
        sliderView.isUserInteractionEnabled = false
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
    
    func scaleAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale.x")
        animation.isAdditive = true
        animation.fromValue = 1
        animation.toValue = 2
        animation.autoreverses = true
        animation.isAdditive = true
        animation.duration = 2
        
        monsterImg.layer.add(animation, forKey: "myHoverAnimation")
    }
    
    func playMusic() {
        guard let path = Bundle.main.path(forResource: "FightingSound", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            
        }
    }
    
    func playEffect() {
        guard let path = Bundle.main.path(forResource: "Laugh", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            effectPlayer = try AVAudioPlayer(contentsOf: url)
            effectPlayer?.play()
        } catch {
            
        }
    }
}
