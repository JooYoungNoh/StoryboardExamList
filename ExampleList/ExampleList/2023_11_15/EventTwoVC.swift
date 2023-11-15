//
//  EventTwoVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/15.
//

import UIKit

class EventTwoVC: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    var dataString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.backButton.layer.cornerRadius = 20
        dataLabel.text = dataString
        myImageView.image = UIImage(named: dataString)
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
