//
//  SettingsViewController.swift
//  8Ball
//
//  Created by Alexandr Kutorai on 27.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var completionHandler: ((String)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonTap(_ sender: UIButton) {
        
        guard let textAnsw = answerTextField.text else {return}
        
        completionHandler?(textAnsw)
        answerTextField.text = ""
        
    }
    
}


