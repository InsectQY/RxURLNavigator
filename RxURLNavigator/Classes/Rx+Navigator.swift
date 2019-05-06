//
//  Rx+Navigator.swift
//  Pods-RxURLNavigator_Example
//
//  Created by Insect on 2019/2/1.
//

import UIKit
import RxSwift
import RxCocoa
import URLNavigator

public extension Reactive where Base: Navigator {

    func push(_ url: URLConvertible,
              context: Any? = nil,
              from: UINavigationControllerType? = nil,
              animated: Bool = true) -> Observable<UIViewController?> {

            let vc = self.base.push(url,
                                    context: context,
                                    from: from,
                                    animated: animated)
            return Observable<UIViewController?>.just(vc)
    }

    func present(_ url: URLConvertible,
                 context: Any? = nil,
                 wrap: UINavigationController.Type? = nil,
                 from: UIViewControllerType? = nil,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) -> Observable<UIViewController?> {

            let vc = self.base.present(url,
                                       context: context,
                                       wrap: wrap,
                                       from: from,
                                       animated: animated,
                                       completion: completion)
            return Observable<UIViewController?>.just(vc)
    }
}
