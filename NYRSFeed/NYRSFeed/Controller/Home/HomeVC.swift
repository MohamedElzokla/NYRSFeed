//
//  HomeVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {
    @IBOutlet weak var searchContainerView: UIView?
    
    
    @IBOutlet weak var tableView: UITableView?
    var articles = [Article](){
        didSet{
            searchResults = articles
        }
    }
    var searchResults : [Article]?{
        didSet{
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSideMenuBtn()
        loadDatasource()
    }
    
    //MARK:- Actions
    @IBAction func sectionSelectionAction(_ sender: Any) {
        let sections = ["Arts","Education","Automobiles","Blogs","Books","all-sections"]
        let alertController = UIAlertController(title: "Sections", message: "Choose one Section", preferredStyle: .actionSheet)
        for title in sections {
            alertController.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
                self.loadDatasource(section: action.title ?? "all-sections")
            }))
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func searchBtnAction(_ sender: Any) {
    }
    
    func loadDatasource(section:String = "all-sections" ){
        self.showLoadingIndicator()
        WebService.getMostViewedArticles { (response) in
            self.hideLoadingIndicator()
            if let newArticles = response?.articles{
                self.articles = newArticles
            }else {
                self.showAlert(message: response?.error?.message ?? "")
            }
        }
    }

    
    
}

//MARK:- UITableViewDelegate, UITableViewDataSource
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVC", for:indexPath) as? HomeTVC
        let article = searchResults?[indexPath.row]
        cell?.loadArticle(article: article)
        return cell ?? UITableViewCell()
    }
}



//MARK:- UISearchBarDelegate
extension HomeVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if articles.count > 0 {
            let result = articles.filter({ (oneItem) -> Bool in
                return oneItem.abstract?.lowercased().contains(searchText.lowercased()) ?? false
            })
            searchResults = (result.count == 0) ? articles : result
        }
    }
}
