//
//  ViewController.swift
//  8Ball
//
//  Created by Alexandr Kutorai on 26.01.2022.
//

import UIKit


class ViewController: UIViewController {
    
    private let toSetting = "toSetting"
    
    private var arrayAnswers = [String]()
    
    @IBOutlet weak var tetxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        becomeFirstResponder()
        
    }
    
    fileprivate func getAnswer() {
        NetworkService.getMagic { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.sync {
                switch result {
                case.success(let model):
                    self.tetxLabel.text = model?.magic.answer
                case.failure(_):
                    self.tetxLabel.text = self.arrayAnswers.randomAnswer()
                }
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toSetting {
            if let selectVC = segue.destination as? SettingsViewController {
                selectVC.completionHandler = { [weak self] text in
                    guard let self = self else {return}
                    self.arrayAnswers.append(text)
                    
                }
            }
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            getAnswer()
        }
    }
    
}

extension Array {
    func randomAnswer() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
