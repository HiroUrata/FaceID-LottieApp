//
//  ViewController.swift
//  FaceIDLesson
//
//  Created by UrataHiroki on 2021/07/13.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

    @IBAction func faceID(_ sender: Any) {
        
        let context = LAContext()
        var error: NSError? = nil
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Please authorize with touch id!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [self] success, error in
                DispatchQueue.main.async { [self] in
                    
                    guard success, error == nil else{
                         //認証失敗時
                        self.alert(titleString: "!!!Faild!!!", messageString: "FaceID認証に失敗しました")
                        
                        return
                    
                  }
                          //認証成功時
                        self.alert(titleString: "!!!Succesd!!!", messageString: "FaceID認証に成功しました")
                }
            }
         }
      }

    
    
    func alert(titleString:String,messageString:String){
        
        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            
            let LottieVC = self.storyboard?.instantiateViewController(identifier: "LottieVC") as! LottieViewController
            
            self.navigationController?.pushViewController(LottieVC, animated: true)
            
            
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

