//
//  URLNavigatorWrap+Binder.swift
//  GamerSky
//
//  Created by Insect on 2018/11/2.
//  Copyright © 2018 engic. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import URLNavigator

public extension Reactive where Base: Navigator {
    
    var push: Binder<URLNavigatorPushWrap> {
        
        return Binder(base) { navigator, wrap in
            navigator.push(wrap.url,
                           context: wrap.context,
                           from: wrap.from,
                           animated: wrap.animated)
        }
    }
    
    var present: Binder<URLNavigatorPresentWrap> {
        
        return Binder(base) { navigator, wrap in
            navigator.present(wrap.url,
                              context: wrap.context,
                              wrap: wrap.wrap,
                              from: wrap.from,
                              animated: wrap.animated,
                              completion: wrap.completion)
        }
    }
}

extension Navigator: ReactiveCompatible {}
