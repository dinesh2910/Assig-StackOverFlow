//
//  StackOverListViewController.swift
//  Assg-StackOverFlow
//
//  Created by Dinesh Danda on 2/6/21.
//  Copyright © 2021 Dinesh Danda. All rights reserved.
//

import UIKit

class StackOverListViewController: UIViewController {
    
    var answersViewModel = AnswersViewModel()
    
    private let tableView: UITableView = {
        let stackOverTV = UITableView()
        stackOverTV.allowsSelection = false
        stackOverTV.isHidden = true
        stackOverTV.register(UITableViewCell.self, forCellReuseIdentifier: reusableCell)
        return stackOverTV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        fetchAnswers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func fetchAnswers() {
        answersViewModel.fetchAnswers{ [weak self] answers in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    func updateUI() {
        if (answersViewModel.answers?.items.count) != nil{
            self.tableView.isHidden = false;
            tableView.reloadData()
        }
    }
}

//MARK: - UITableview Delegate and UITableView Datasource Methods

extension StackOverListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let  rows = answersViewModel.answers?.items.count{
            return rows
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell, for: indexPath)
        let cellData = answersViewModel.answers?.items[indexPath.row]
        cell.textLabel?.text = cellData?.owner.displayName
        
        return cell
    }
}
