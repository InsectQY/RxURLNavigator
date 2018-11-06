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
        
        let routerType: [RouterType] = [.pushMapBinder, .pushWrapBinder, .presentMapBinder, .presentWrapBinder, .pushMapSubscribe, .pushWrapSubscribe, .presentMapSubscribe, .presentWrapSubscribe]
        
        Observable.just(routerType)
        .bind(to: tableView.rx.items(cellIdentifier: id, cellType: UITableViewCell.self)) { (row, elememt, cell) in
            
            cell.textLabel?.text = elememt.rawValue
            cell.accessoryType = .disclosureIndicator
        }.disposed(by: disposeBag)
        
        // Push With map
        tableView.rx.modelSelected(RouterType.self)
        .filter({$0 == .pushMapBinder})
        .map({_ in URLNavigatorPushWrap(navigator, UserURL.login.path)})
        .bind(to: navigator.rx.push)
        .disposed(by: disposeBag)
        
        // Push With wrap
        tableView.rx.modelSelected(RouterType.self)
        .filter({$0 == .pushWrapBinder})
        .wrapPush(navigator, UserURL.login.path)
        .bind(to: navigator.rx.push)
        .disposed(by: disposeBag)
        
        // Present With map
        tableView.rx.modelSelected(RouterType.self)
        .filter({$0 == .presentMapBinder})
        .map({_ in URLNavigatorPresentWrap(navigator, UserURL.login.path, wrap: UINavigationController.self)})
        .bind(to: navigator.rx.present)
        .disposed(by: disposeBag)
        
        // Present With wrap
        tableView.rx.modelSelected(RouterType.self)
        .filter({$0 == .presentWrapBinder})
        .wrapPresent(navigator, UserURL.login.path, wrap: UINavigationController.self)
        .bind(to: navigator.rx.present)
        .disposed(by: disposeBag)
        
        // Also you can use subscribe
        
        // Push With map
        tableView.rx.modelSelected(RouterType.self)
        .filter({$0 == .pushMapSubscribe})
        .map({_ in URLNavigatorPushWrap(navigator, UserURL.login.path)})
        .push()
        .subscribe { _ in
            
        }.disposed(by: disposeBag)
        
        // Push With wrap
        tableView.rx.modelSelected(RouterType.self)
        .filter({$0 == .pushWrapSubscribe})
        .wrapPush(navigator, UserURL.login.path)
        .push()
        .subscribe { _ in
            
        }.disposed(by: disposeBag)
        
        // Present With map
        tableView.rx.modelSelected(RouterType.self)
        .filter({$0 == .presentMapSubscribe})
        .map({_ in URLNavigatorPresentWrap(navigator, UserURL.login.path, wrap: UINavigationController.self)})
        .present()
        .subscribe { _ in
            
        }.disposed(by: disposeBag)
        
        // Present With wrap
        tableView.rx.modelSelected(RouterType.self)
        .filter({$0 == .presentWrapSubscribe})
        .wrapPresent(navigator, UserURL.login.path, wrap: UINavigationController.self)
        .present()
        .subscribe { _ in
            
        }.disposed(by: disposeBag)
    }
}
