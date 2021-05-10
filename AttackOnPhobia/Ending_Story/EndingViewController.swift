//
//  EndingViewController.swift
//  AttackOnPhobia
//
//  Created by Reza Harris on 04/05/21.
//

import UIKit
import AVFoundation

class EndingViewController: UIViewController {
    
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
    
    var endingStatus: EndingStatus?

    @IBOutlet var viewLayout: UIView!
    @IBOutlet weak var dialogueFrame: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var confetti1: UIImageView!
    @IBOutlet weak var confetti2: UIImageView!
    @IBOutlet weak var confetti3: UIImageView!
    @IBOutlet weak var confetti4: UIImageView!
    @IBOutlet weak var confetti5: UIImageView!
    @IBOutlet weak var confetti6: UIImageView!
    @IBOutlet weak var confetti7: UIImageView!
    @IBOutlet weak var confetti8: UIImageView!
    @IBOutlet weak var confetti9: UIImageView!
    @IBOutlet weak var confetti10: UIImageView!
    @IBOutlet weak var confetti11: UIImageView!
    @IBOutlet weak var confetti12: UIImageView!
    @IBOutlet weak var confetti13: UIImageView!
    @IBOutlet weak var confetti14: UIImageView!
    @IBOutlet weak var confetti15: UIImageView!
    @IBOutlet weak var confetti16: UIImageView!
    @IBOutlet weak var confetti17: UIImageView!
    @IBOutlet weak var confetti18: UIImageView!
    @IBOutlet weak var confetti19: UIImageView!
    @IBOutlet weak var confetti20: UIImageView!
    @IBOutlet weak var confetti21: UIImageView!
    @IBOutlet weak var confetti22: UIImageView!
    @IBAction func finishbtn(_ sender: Any) {
        audioPlayer?.stop()
        self.performSegue(withIdentifier: "backToMain", sender: self)
    }
    @IBOutlet weak var finishBtnOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        effectPlayer?.stop()
        preparation()
        hiddenAll()
        if endingStatus == EndingStatus.win {
            winStatus()
        } else {
            loseStatus()
        }
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var handImageText: UILabel!
    @IBOutlet weak var handImage: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        if endingStatus == EndingStatus.win {
            hoveringEffect()
        }
    }
    
    func winStatus() {
        winMusic()
        topLabel.text = "Congratulation, You've Defeated Your Fear!"
        confetti1.isHidden = false
        confetti2.isHidden = false
        confetti3.isHidden = false
        confetti4.isHidden = false
        confetti5.isHidden = false
        confetti6.isHidden = false
        confetti7.isHidden = false
        confetti8.isHidden = false
        confetti9.isHidden = false
        confetti9.isHidden = false
        confetti10.isHidden = false
        confetti11.isHidden = false
        confetti12.isHidden = false
        confetti13.isHidden = false
        confetti14.isHidden = false
        confetti15.isHidden = false
        confetti16.isHidden = false
        confetti17.isHidden = false
        confetti18.isHidden = false
        confetti19.isHidden = false
        confetti20.isHidden = false
        confetti21.isHidden = false
        confetti22.isHidden = false
        handImage.isHidden = false
        handImageText.isHidden = false
        dialogueFrame.isHidden = false
    }
    
    func hiddenAll() {
        confetti1.isHidden = true
        confetti2.isHidden = true
        confetti3.isHidden = true
        confetti4.isHidden = true
        confetti5.isHidden = true
        confetti6.isHidden = true
        confetti7.isHidden = true
        confetti8.isHidden = true
        confetti9.isHidden = true
        confetti9.isHidden = true
        confetti10.isHidden = true
        confetti11.isHidden = true
        confetti12.isHidden = true
        confetti13.isHidden = true
        confetti14.isHidden = true
        confetti15.isHidden = true
        confetti16.isHidden = true
        confetti17.isHidden = true
        confetti18.isHidden = true
        confetti19.isHidden = true
        confetti20.isHidden = true
        confetti21.isHidden = true
        confetti22.isHidden = true
        handImage.isHidden = true
        handImageText.isHidden = true
        dialogueFrame.isHidden = true
    }
    
    func loseStatus() {
        loseMusic()
        topLabel.text = "You're Failed to Overcome Your Fear!"
        topLabel.textColor = #colorLiteral(red: 0.6025703549, green: 0.02445631102, blue: 0.01930862479, alpha: 1)
        let image = UIImage(named: "MonsterFear")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 25, y: 280, width: 350, height: 350)
        viewLayout.addSubview(imageView)
    }
    
    func preparation() {
        finishBtnOutlet.layer.cornerRadius = 8
        finishBtnOutlet.layer.shadowColor = UIColor.black.cgColor
        finishBtnOutlet.layer.shadowOpacity = 2
        finishBtnOutlet.layer.masksToBounds = false
        finishBtnOutlet.layer.shadowOffset = CGSize(width: 3.5, height: 3.5)
        finishBtnOutlet.layer.shadowRadius = 2
    }
    
    func winMusic() {
        guard let path = Bundle.main.path(forResource: "EpicWin", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            
        }
    }
    
    func loseMusic() {
        guard let path = Bundle.main.path(forResource: "GameOver", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            
        }
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
        
        handImage.layer.add(hover, forKey: "myHoverAnimation")
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
