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
    
    //서치바
    var searching: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    var matchArr: [TablePracticeModel] = []
    var searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiButtonCreate()
        self.uiSearchBarCreate()
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

//MARK: 서치바 메소드
extension TablePracticeVC {
    func uiSearchBarCreate() {
        //서치바 UI
        self.searchController.searchBar.delegate = self
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.placeholder = "Search Name"
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.definesPresentationContext = true
        
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension TablePracticeVC: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        self.matchArr = self.items.filter( { (list: TablePracticeModel) -> Bool in
            return list.attractionNames.lowercased().contains(text.lowercased())
        })
        self.tableView.reloadData()
    }
}

//MARK: 버튼 메소드
extension TablePracticeVC {
    @objc func buttonClick(_ sender: UIBarButtonItem) {
        guard let addView = self.storyboard?.instantiateViewController(identifier: "TableAddVC") as? TableAddVC else { return }
        addView.modalPresentationStyle = .overCurrentContext
        addView.modalTransitionStyle = .crossDissolve
        
        self.present(addView, animated: true)
    }
    
    func uiButtonCreate() {
        let addButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(buttonClick(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        self.tableView.separatorStyle = .none
    }
}


//MARK: 테이블 뷰 메소드
extension TablePracticeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TablePracticeCell", for: indexPath) as? TablePracticeCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.profileImageView.layer.cornerRadius = 20
        
        if self.searching {
            cell.nameLabel.text = self.matchArr[indexPath.row].attractionNames
            cell.profileImageView.image = UIImage(named: self.matchArr[indexPath.row].attractionImages)
        } else {
            cell.nameLabel.text = self.items[indexPath.row].attractionNames
            cell.profileImageView.image = UIImage(named: self.items[indexPath.row].attractionImages)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searching ? self.matchArr.count : self.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140 
    }
}

extension TablePracticeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextView = self.storyboard?.instantiateViewController(identifier: "TableDetailVC") as? TableDetailVC else { return }
        
        nextView.webSite = self.searching ? self.matchArr[indexPath.row].webAddresses : self.items[indexPath.row].webAddresses
        
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
