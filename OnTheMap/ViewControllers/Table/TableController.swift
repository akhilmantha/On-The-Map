//
//  TableController.swift
//  OnTheMap
//
//  Created by akhil mantha on 02/05/18.
//  Copyright © 2018 akhil mantha. All rights reserved.
//

import UIKit

//Mark: TableViewController: UIViewController

class TableController: UIViewController, RefreshData {
    
    // MARK: Properties
    var studentsLocations: [StudentLocation] = [StudentLocation]()
    private let refreshControl = UIRefreshControl()
    @IBOutlet var tableView: UITableView!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let os = ProcessInfo().operatingSystemVersion
        if (os.majorVersion <= 9) {
            // remove top space
            tableView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0);
        }
        addPullRefresh(tableView: tableView, refreshControl: refreshControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        studentsLocations = StudentModel.sharedInstance.studentsLocations
        tableView.reloadData()
    }
    
    // MARK: RefreshData
    func refresh() {
        studentsLocations = StudentModel.sharedInstance.studentsLocations
        performUIUpdatesOnMain {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: UI
    @objc func fetchTableData(_ sender: Any) {
        StudentModel.sharedInstance.updateStudentsLocations(controller:self)
    }
}

