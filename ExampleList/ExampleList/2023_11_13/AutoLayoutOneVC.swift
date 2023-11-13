//
//  AutoLayoutOneVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/13.
//

import UIKit

class AutoLayoutOneVC: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var worldLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.borderStyle = .roundedRect
        self.blueButton.layer.cornerRadius = 10
    }

}
