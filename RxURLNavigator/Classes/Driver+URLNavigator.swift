//
//  Driver+URLNavigator.swift
//  Pods-RxURLNavigator_Example
//
//  Created by QY on 2018/11/14.
//

import RxSwift
import URLNavigator
import RxCocoa

public extension SharedSequence where SharingStrategy == DriverSharingStrategy {
    
    func wrapPush(_ navigator: Navigator,
                  _ url: URLConvertible,
                  context: Any? = nil,
                  from: UINavigationControllerType? = nil,
                  animated: Bool = true) -> Driver<URLNavigatorPushWrap> {
        
        return flatMap { _ -> Driver<URLNavigatorPushWrap> in
            Driver.just(URLNavigatorPushWrap(navigator,
                                             url, context: context,
                                             from: from,
                                             animated: animated))
        }
    }
    
    func wrapPresent(_ navigator: Navigator,
                     _ url: URLConvertible,
                     context: Any? = nil,
                     wrap: UINavigationController.Type? = nil,
                     from: UIViewControllerType? = nil,
                     animated: Bool = true,
                     completion: (() -> ())? = nil) -> Driver<URLNavigatorPresentWrap> {
        
        return flatMap { _ -> Driver<URLNavigatorPresentWrap> in
            Driver.just(URLNavigatorPresentWrap(navigator,
                                                url, context: context,
                                                wrap: wrap,
                                                from: from,
                                                animated: animated,
                                                completion: completion))
        }
    }
}
