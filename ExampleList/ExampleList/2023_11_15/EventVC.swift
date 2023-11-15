//
//  EventVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/15.
//

import UIKit
import SnapKit

class EventVC: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var mySwitch: UISwitch!
    
    private let imageArr: [String] = ["blueGlass", "cuteGlass", "fallGlass", "prettyGlass", "showGlass", "whiteGlass"]
    private var index: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        uiCreate()
        self.myButton.layer.cornerRadius = 20
        self.myImageView.image = UIImage(named: imageArr[0])
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        self.index = self.index == 5 ? 0 : self.index+1
        
        self.myImageView.image = UIImage(named: imageArr[index])
    }

    @IBAction func switchToggle(_ sender: UISwitch) {
        self.myImageView.snp.removeConstraints()
        if sender.isOn {
            self.myImageView.snp.makeConstraints { make in
                make.width.height.equalTo(200)
            }
        } else {
            self.myImageView.snp.makeConstraints { make in
                make.width.height.equalTo(100)
            }
        }
    }
    
    @IBAction func unwindToVC(_ sender: UIStoryboardSegue) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func uiCreate() {
        
        self.myButton.layer.cornerRadius = 20
        self.nextButton.layer.cornerRadius = 20
        
        self.myImageView.image = UIImage(named: imageArr[0])
    }
    
    //네비게이션
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextView = segue.destination as? EventTwoVC else { return }
        nextView.dataString = imageArr[index]
        
    }
}
