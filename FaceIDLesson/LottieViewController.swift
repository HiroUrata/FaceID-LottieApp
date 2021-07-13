//
//  LottieViewController.swift
//  FaceIDLesson
//
//  Created by UrataHiroki on 2021/07/13.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {

    
    let animationView = AnimationView()
    let lottieAnimation = Animation.named("good")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createLottie()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    

    func createLottie(){
        
        
        
        animationView.frame = CGRect(x: 0, y: 88, width: 442, height: 412)
        
        animationView.animation = lottieAnimation
        animationView.contentMode = .scaleToFill
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
    }
   

    @IBAction func back(_ sender: Any) {
        
        animationView.removeFromSuperview() //アニメーションをストップ
        
        let VC = self.storyboard?.instantiateViewController(identifier: "VC") as! ViewController
        
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
    
}
