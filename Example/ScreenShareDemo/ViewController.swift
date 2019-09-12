//
//  ViewController.swift
//  ScreenShareDemo

import UIKit
import CoreGraphics
import AssistSDK


class ViewController: UIViewController,UITextViewDelegate {
    
    //    MARK: Properties
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var textview: UITextField!
    
    //    MARK: Viewcontroller methods
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        infoLabel.isHidden = true
        
        loader.isHidden = true
        
        textview.text = ""
    }
    
    //    MARK: IBActions methods
    
    @IBAction func startSession(_ sender: Any) {
       
        loader.isHidden = false
        loader.startAnimating()
        
        self.infoLabel.isHidden = true
        
        if let id = textview.text, !id.isEmpty {
            
//            APP TOKEN
            let token = "wSsVR60n+hf1Ca8ozjSrde47yA5QB1v/EEV42FH16SX9F6vC8cc5lEGfDFOgTaMYEWdsQGZHprh8kRYD1DcIiNotzVlSDyiF9mqRe1U4J3x1pLnvkT7OV21dkxOILY4LwgxqmA=="
            
//            Validating token and registering session id
//            At completion you will get SessionValidation enum response
            
            AssistSession.register(session: id, token: token) {[weak self] (validationState) in
                
//                Session registration completion block
                
                guard let `self` = self else {
                    return
                }
                
                DispatchQueue.main.async {
                    
                    self.loader.stopAnimating()
                    self.loader.isHidden = true
                    
                    self.infoLabel.isHidden = false
                    switch validationState {
                        
                    case .success:
                        // Session validation successfully done and session has been registered.
                        // Now go to control panel and start screen broadcast.
                        
                        self.infoLabel.text = "Now go to control panel and choose ScreenShareDemo app to boradcast your mobile screen."

                    case .failure(let error):
                        // Error while registering the session.
                        // Please verify the session id and App token.

                        guard let errorstate = error as? SessionValidation.FailureState else {
                            self.infoLabel.text = "Error while fetching session info."
                            return
                        }

                        switch errorstate {
                        case .invalidKey:
                            self.infoLabel.text = "Invalid session key"

                        case .sessionKeyExpired:
                            self.infoLabel.text = "Your session key has been expired"
                            
                        default:
                            self.infoLabel.text = "Error \(errorstate.localizedDescription)"
                        }

                    }
                }
            }
            
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

