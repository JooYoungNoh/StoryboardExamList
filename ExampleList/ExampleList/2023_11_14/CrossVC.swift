//
//  CrossVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/14.
//

import UIKit

class CrossVC: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var centerConstration: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiCreate()
    }
    
    func uiCreate(){
        myView.removeConstraint(centerConstration)
        
        myLabel.trailingAnchor.constraint(equalTo: myButton.trailingAnchor).isActive = true
    }

}
