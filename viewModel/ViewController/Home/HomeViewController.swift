//
//  HomeViewController.swift
//  viewModel
//
//  Created by Nguyen Anh Tuan on 26/6/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
        configTableView()
    }
    
    private func configNavigation() {
        title = "Home"
        let goToScreenAddUser = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(goToScreenAddUserFunc))
        navigationItem.rightBarButtonItems = [goToScreenAddUser]
    }
    
    @objc func goToScreenAddUserFunc() {
        let addUserScreen = AddUserViewController()
        addUserScreen.userDatasource = self
        addUserScreen.completeAddUser = { userModel in
            self.homeViewModel.addUser(userModel: userModel)
            self.reloadTable()
            self.navigationController?.popViewController(animated: true)
        }
        navigationController?.pushViewController(addUserScreen, animated: true)
    }
    
    private func configTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    
    func goToDetail(indexPath: IndexPath) {
        let detailViewController = DetailUserViewController(userModel:  homeViewModel.userArrays[indexPath.row])
        detailViewController.ICallBackVoid = { user in
            if let row = self.homeViewModel.userArrays.firstIndex(where: {
                $0.id == user.id
            }) {
                self.homeViewModel.userArrays[row] = user
                self.reloadTable()
            }
            self.navigationController?.popViewController(animated: true)
        }
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension HomeViewController: UserModelDatasource {
    func getArrayUser() -> [UserModel] {
        homeViewModel.userArrays
    }
}
