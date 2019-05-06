//
//  Observable+URLNavigator.swift
//  GamerSky
//
//  Created by Insect on 2018/11/2.
//  Copyright © 2018 engic. All rights reserved.
//

import RxSwift
import URLNavigator

public extension ObservableType {
    
    func wrapPush(_ navigator: Navigator,
                  _ url: URLConvertible,
                  context: Any? = nil,
                  from: UINavigationControllerType? = nil,
                  animated: Bool = true) -> Observable<URLNavigatorPushWrap> {
        
        return flatMap { _ -> Observable<URLNavigatorPushWrap> in
            Observable.just(URLNavigatorPushWrap(navigator,
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
                     completion: (() -> ())? = nil) -> Observable<URLNavigatorPresentWrap> {
        
        return flatMap { _ -> Observable<URLNavigatorPresentWrap> in
            Observable.just(URLNavigatorPresentWrap(navigator,
                                                    url,
                                                    context: context,
                                                    wrap: wrap,
                                                    from: from,
                                                    animated: animated,
                                                    completion: completion))
        }
    }
}
