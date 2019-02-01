//
//  HomeViewController.swift
//  RxURLNavigator_Example
//
//  Created by Insect on 2018/11/5.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import RxURLNavigator
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {

    private var disposeBag = DisposeBag()
    private let id = "cell"

    // MARK: - Lazyload
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        let routerType: [RouterType] = [.pushWithBinder, .presentWithBinder, .pushWithSubscribe, .presentWithSubscribe]
        
        Observable.just(routerType)
        .bind(to: tableView.rx.items(cellIdentifier: id, cellType: UITableViewCell.self)) { (row, elememt, cell) in
            
            cell.textLabel?.text = elememt.rawValue
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
        }.disposed(by: disposeBag)

        // Push With Subscribe
        tableView.rx.modelSelected(RouterType.self)
        .filter { $0 == .pushWithSubscribe }
        .map { _ in navigator.rx.push(UserURL.login.path) }
        .subscribe { _ in

        }.disposed(by: disposeBag)

        // Present With Subscribe
        tableView.rx.modelSelected(RouterType.self)
        .filter { $0 == .presentWithSubscribe }
        .map { _ in navigator.rx.present(UserURL.login.path, wrap: UINavigationController.self) }
        .subscribe { 
            print($0)
        }.disposed(by: disposeBag)

        /// Also you can use Binder

        //  Push With Binder
        tableView.rx.modelSelected(RouterType.self)
        .filter { $0 == .pushWithBinder }
        .wrapPush(navigator, UserURL.login.path)
        .bind(to: navigator.rx.push)
        .disposed(by: disposeBag)
        
        // Present With Binder
        tableView.rx.modelSelected(RouterType.self)
        .filter { $0 == .presentWithBinder }
        .wrapPresent(navigator, UserURL.login.path, wrap: UINavigationController.self)
        .bind(to: navigator.rx.present)
        .disposed(by: disposeBag)
    }
}
