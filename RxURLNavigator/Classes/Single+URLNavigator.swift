//
//  Single+URLNavigator.swift
//  GamerSky
//
//  Created by Insect on 2018/11/2.
//  Copyright © 2018 engic. All rights reserved.
//

import RxSwift
import URLNavigator
import RxCocoa

public extension PrimitiveSequence where TraitType == SingleTrait {
    
    public func wrapPush(_ navigator: Navigator, _ url: URLConvertible, context: Any? = nil, from: UINavigationControllerType? = nil, animated: Bool = true) -> Single<URLNavigatorPushWrap> {

        return flatMap({ _ -> Single<URLNavigatorPushWrap> in
            Single.just(URLNavigatorPushWrap(navigator, url, context: context, from: from, animated: animated))
        })
    }
    
    public func wrapPresent(_ navigator: Navigator, _ url: URLConvertible, context: Any? = nil, wrap: UINavigationController.Type? = nil, from: UIViewControllerType? = nil, animated: Bool = true, completion: (() -> ())? = nil) -> Single<URLNavigatorPresentWrap> {
        
        return flatMap({ _ -> Single<URLNavigatorPresentWrap> in
            Single.just(URLNavigatorPresentWrap(navigator, url, context: context, wrap: wrap, from: from, animated: animated, completion: completion))
        })
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, E: URLNavigatorPushWrap {
    
    public func push() -> Single<UIViewController?> {
        
        return flatMap({
            Single.just($0.navigator.push($0.url, context: $0.context, from: $0.from, animated: $0.animated))
        })
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, E: URLNavigatorPresentWrap {
    
    public func present() -> Single<UIViewController?> {
        
        return flatMap({
            
            Single.just($0.navigator.present($0.url, context: $0.context, wrap: $0.wrap, from: $0.from, animated: $0.animated, completion: $0.completion))
        })
    }
}


