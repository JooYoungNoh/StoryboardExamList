//
//  InteractionExamVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/10.
//

import UIKit

class InteractionExamVC: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonClick(_ sender: UIButton) {
        helloLabel.text = "Hello, \(textField.text ?? "")"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
