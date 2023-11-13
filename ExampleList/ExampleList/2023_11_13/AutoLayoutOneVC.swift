//
//  AutoLayoutOneVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/13.
//

import UIKit
import Combine

class AutoLayoutOneVC: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var worldLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    
    var disposalbleBag = Set<AnyCancellable>()
    var viewModel: CountViewModel?
    
    @IBAction func buttonClick(_ sender: UIButton) {
        self.viewModel?.count += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.worldLabel.text = "\(self.viewModel?.count ?? -1)"
        
        self.textField.borderStyle = .roundedRect
        self.blueButton.layer.cornerRadius = 10
        
        setBinding()
    }
    
    func setBinding(){
        print("setBinding")
        self.viewModel?.$count.sink{ (updatedList : Int) in
            self.worldLabel.text = "\(updatedList)"
        }.store(in: &disposalbleBag)
    }

}
