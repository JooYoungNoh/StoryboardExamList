//
//  TablePracticeVC.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/16.
//

import UIKit

struct TablePracticeModel {
    var attractionNames: String
    var webAddresses: String
    var attractionImages: String
}

class TablePracticeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [TablePracticeModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    
        self.items = [
            TablePracticeModel(attractionNames: "Buckingham Palace", webAddresses: "https://en.wikipedia.org/wiki/Buckingham_Palace", attractionImages: "brownGlass"),
            TablePracticeModel(attractionNames: "The Eiffel Tower", webAddresses: "https://en.wikipedia.org/wiki/Eiffel_Tower", attractionImages: "friendGlass"),
            TablePracticeModel(attractionNames: "The Grand Canyon", webAddresses: "https://en.wikipedia.org/wiki/Grand_Canyon", attractionImages: "doctorGlass"),
            TablePracticeModel(attractionNames: "Windsor Castle", webAddresses: "https://en.wikipedia.org/wiki/Windsor_Castle", attractionImages: "sparkleGlass"),
            TablePracticeModel(attractionNames: "Empire State Building", webAddresses: "https://en.wikipedia.org/wiki/Empire_State_Building", attractionImages: "strawberryGlass")
        ]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension TablePracticeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TablePracticeCell", for: indexPath) as? TablePracticeCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        cell.nameLabel.text = self.items[indexPath.row].attractionNames
        cell.profileImageView.image = UIImage(named: self.items[indexPath.row].attractionImages)
        cell.profileImageView.layer.cornerRadius = 20
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140 
    }
}

extension TablePracticeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextView = self.storyboard?.instantiateViewController(identifier: "TableDetailVC") as? TableDetailVC else { return }
        
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
}
