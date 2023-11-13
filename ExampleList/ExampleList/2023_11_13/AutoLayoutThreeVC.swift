//
//  AutoLayoutThreeVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/13.
//

import UIKit

class AutoLayoutThreeVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.layer.cornerRadius = 10
        self.textField.layer.cornerRadius = 10
        self.button1.layer.cornerRadius = 10
        self.button2.layer.cornerRadius = 10
        self.button3.layer.cornerRadius = 10
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
