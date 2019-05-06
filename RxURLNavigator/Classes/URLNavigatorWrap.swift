//
//  URLNavigatorWrap.swift
//  GamerSky
//
//  Created by Insect on 2018/11/2.
//  Copyright © 2018 engic. All rights reserved.
//

import URLNavigator

public class URLNavigatorWrap {
    
    let navigator: Navigator
    let url: URLConvertible
    let context: Any?
    let animated: Bool
    
    public init(_ navigator: Navigator,
                _ url: URLConvertible,
                context: Any? = nil,
                animated: Bool = true) {
        
        self.navigator = navigator
        self.url = url
        self.context = context
        self.animated = animated
    }
}

public class URLNavigatorPushWrap: URLNavigatorWrap {
    
    let from: UINavigationControllerType?
    
    public init(_ navigator: Navigator,
                _ url: URLConvertible,
                context: Any? = nil,
                wrap: UINavigationController.Type? = nil,
                from: UINavigationControllerType? = nil,
                animated: Bool = true) {
        
        self.from = from
        super.init(navigator,
                   url,
                   context: context,
                   animated: animated)
    }
}

public class URLNavigatorPresentWrap: URLNavigatorWrap {

    let wrap: UINavigationController.Type?
    let from: UIViewControllerType?
    let completion: (() -> ())?
    
    public init(_ navigator: Navigator,
                _ url: URLConvertible,
                context: Any? = nil,
                wrap: UINavigationController.Type? = nil,
                from: UIViewControllerType? = nil,
                animated: Bool = true,
                completion: (() -> ())? = nil) {
        
        self.wrap = wrap
        self.from = from
        self.completion = completion
        super.init(navigator, url,
                   context: context,
                   animated: animated)
    }
}

