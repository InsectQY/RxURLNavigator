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

public extension PrimitiveSequence where Trait == SingleTrait {
    
    func wrapPush(_ navigator: Navigator,
                  _ url: URLConvertible,
                  context: Any? = nil,
                  from: UINavigationControllerType? = nil,
                  animated: Bool = true) -> Single<URLNavigatorPushWrap> {

        return flatMap { _ -> Single<URLNavigatorPushWrap> in
            Single.just(URLNavigatorPushWrap(navigator,
                                             url,
                                             context: context,
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
                     completion: (() -> ())? = nil) -> Single<URLNavigatorPresentWrap> {
        
        return flatMap { _ -> Single<URLNavigatorPresentWrap> in
            Single.just(URLNavigatorPresentWrap(navigator, url,
                                                context: context,
                                                wrap: wrap,
                                                from: from,
                                                animated: animated,
                                                completion: completion))
        }
    }
}
