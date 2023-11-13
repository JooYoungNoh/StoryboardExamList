//
//  AutoLayoutFourVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/13.
//

import UIKit
import Combine

class AutoLayoutFourVC: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var viewModel: CountViewModel = CountViewModel()
    
    var disposalbleBag = Set<AnyCancellable>()
    
    @IBAction func buttonOneClick(_ sender: UIButton){
        guard let nv = self.storyboard?.instantiateViewController(withIdentifier: "AutoLayoutOneVC") as? AutoLayoutOneVC else { return }
        nv.viewModel = self.viewModel
        
        self.navigationController?.pushViewController(nv, animated: true)
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        self.viewModel.count += 1
    }
    
    func setBinding(){
        print("setBinding")
        self.viewModel.$count.sink{ (updatedList : Int) in
            self.countLabel.text = "\(updatedList)"
        }.store(in: &disposalbleBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.button1.layer.cornerRadius = 10
        self.button3.layer.cornerRadius = 10
        
        setBinding()
    }

}

class CountViewModel: ObservableObject {
    @Published var count: Int = 0
}
