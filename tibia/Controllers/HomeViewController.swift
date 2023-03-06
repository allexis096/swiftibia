//
//  HomeViewController.swift
//  tibia
//
//  Created by allexis figueiredo on 05/03/23.
//

import UIKit

class HomeViewController: UIViewController,
                          UITableViewDelegate,
                          UITableViewDataSource {
    
    var news = [NewsTableViewCellViewModel]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "cell")
        
//        tableView.layer.cornerRadius = 15
//        tableView.clipsToBounds = true
//
//        // Top Left Corner: .layerMinXMinYCorner
//        // Top Right Corner: .layerMaxXMinYCorner
//        // Bottom Left Corner: .layerMinXMaxYCorner
//        // Bottom Right Corner: .layerMaxXMaxYCorner
//        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Constants.Strings.News
        
        tableView.delegate = self
        tableView.dataSource = self
        
        news = [
            NewsTableViewCellViewModel(id: 7034,
                                       date: "2023-03-04",
                                       news: "Orcsoberfest",
                                       category: "community",
                                       type: "news",
                                       url: "https://www.tibia.com/news/?subtopic=newsarchive&id=7034"),
            NewsTableViewCellViewModel(id: 7034,
                                       date: "2023-03-04",
                                       news: "Tournaments Content Removal",
                                       category: "development",
                                       type: "news",
                                       url: "https://www.tibia.com/news/?subtopic=newsarchive&id=7034"),
            NewsTableViewCellViewModel(id: 7034,
                                       date: "2023-03-04",
                                       news: "Double XP and Double Skill Weekend",
                                       category: "bla",
                                       type: "news",
                                       url: "https://www.tibia.com/news/?subtopic=newsarchive&id=7034")
        ]
        
        configUI()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods
    //-----------------------------------------------------------------------
    
    private func configUI() {
        view.addSubview(tableView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(tableViewConstraints)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - UITableviewDelegate, UITableViewDataSource
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        cell.configUI(with: news[indexPath.row])
        
        if indexPath.row == 0 {
            cell.layer.cornerRadius = 10
            cell.clipsToBounds = true
            cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        if indexPath.row == news.count - 1 {
            cell.layer.cornerRadius = 10
            cell.clipsToBounds = true
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
