//
//  TablePracticeVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/16.
//

import UIKit

class TablePracticeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = ["Kim", "Lee", "Park"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension TablePracticeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TablePracticeCell", for: indexPath) as? TablePracticeCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
}
