//
//  AutoLayoutTwoVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/13.
//

import UIKit

class AutoLayoutTwoVC: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    
    @IBOutlet weak var buttonL: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonR: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.buttonL.layer.cornerRadius = 10
        self.buttonC.layer.cornerRadius = 10
        self.buttonR.layer.cornerRadius = 10
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
