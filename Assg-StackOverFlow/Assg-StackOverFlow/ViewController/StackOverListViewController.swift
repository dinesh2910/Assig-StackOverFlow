//
//  StackOverListViewController.swift
//  Assg-StackOverFlow
//
//  Created by Dinesh Danda on 2/6/21.
//  Copyright © 2021 Dinesh Danda. All rights reserved.
//

import UIKit
import SDWebImage

class StackOverListViewController: UIViewController {
        
    @IBOutlet var stackOverTV: UITableView!
    var answersViewModel = AnswersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        stackOverTV.allowsSelection = false
        self.title = title
        stackOverTV.register(UINib(nibName: customTableviewCell, bundle: nil), forCellReuseIdentifier: reusableCell)

        stackOverTV.isHidden = true
        stackOverTV.delegate = self
        stackOverTV.dataSource = self
        fetchAnswers()
    }

   internal func fetchAnswers() {
        answersViewModel.fetchAnswers{ [weak self] answers in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }
    
   internal func updateUI() {
        if (answersViewModel.answers?.items.count) != nil{
            self.stackOverTV.isHidden = false;
            stackOverTV.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell, for: indexPath) as? CustomTableviewCell
        let cellData = answersViewModel.answers?.items[indexPath.row]
        cell?.displayName?.text = cellData?.owner.displayName
        cell?.acceptanceRate?.text = "\(cellData?.owner.acceptRate ?? 0)"
        cell?.profileImage.sd_setImage(with: URL(string: ((cellData?.owner.profileImage)!)), placeholderImage: UIImage(named: "placeholder.png"))
        cell?.profileImage.layer.borderWidth = 1.0
        cell?.profileImage.layer.masksToBounds = false
        cell?.profileImage.layer.borderColor = UIColor.white.cgColor
        cell?.profileImage.layer.cornerRadius = (cell?.profileImage.frame.size.width)! / 2
        cell?.profileImage.clipsToBounds = true
        return cell!
    }
}
