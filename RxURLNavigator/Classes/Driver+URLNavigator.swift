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
    
    public func wrapPush(_ navigator: Navigator, _ url: URLConvertible, context: Any? = nil, from: UINavigationControllerType? = nil, animated: Bool = true) -> Driver<URLNavigatorPushWrap> {
        
        return flatMap({ _ -> Driver<URLNavigatorPushWrap> in
            Driver.just(URLNavigatorPushWrap(navigator, url, context: context, from: from, animated: animated))
        })
    }
    
    public func wrapPresent(_ navigator: Navigator, _ url: URLConvertible, context: Any? = nil, wrap: UINavigationController.Type? = nil, from: UIViewControllerType? = nil, animated: Bool = true, completion: (() -> ())? = nil) -> Driver<URLNavigatorPresentWrap> {
        
        return flatMap({ _ -> Driver<URLNavigatorPresentWrap> in
            Driver.just(URLNavigatorPresentWrap(navigator, url, context: context, wrap: wrap, from: from, animated: animated, completion: completion))
        })
    }
}

extension SharedSequence where SharingStrategy == DriverSharingStrategy, E: URLNavigatorPushWrap {
    
    public func push() -> Driver<UIViewController?> {
        
        return flatMap({
            Driver.just($0.navigator.push($0.url, context: $0.context, from: $0.from, animated: $0.animated))
        })
    }
}

extension SharedSequence where SharingStrategy == DriverSharingStrategy, E: URLNavigatorPresentWrap {
    
    public func present() -> Driver<UIViewController?> {
        
        return flatMap({
            
            Driver.just($0.navigator.present($0.url, context: $0.context, wrap: $0.wrap, from: $0.from, animated: $0.animated, completion: $0.completion))
        })
    }
}
