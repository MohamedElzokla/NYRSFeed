//
//  HomeVC.swift
//  NYRSFeed
//
//  Created by Mohamed Ismail on 11/12/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSideMenuBtn()
        loadDatasource()
    }
    
    func loadDatasource(){
        self.showLoadingIndicator()
        WebService.getMostViewedArticles { (response) in
            self.hideLoadingIndicator()
            if let newArticles = response?.articles{
                self.articles = newArticles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else {
                self.showAlert(message: response?.error?.message ?? "")
            }
        }
    }


}


extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVC", for:indexPath) as? HomeTVC
        cell?.loadArticle(article: articles[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
