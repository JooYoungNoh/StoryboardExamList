//
//  EventFourVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/15.
//

import UIKit

class EventFourVC: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.backButton.layer.cornerRadius = 20
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
