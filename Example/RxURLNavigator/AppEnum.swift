//
//  AppEnum.swift
//  RxURLNavigator_Example
//
//  Created by Insect on 2018/11/5.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

enum RouterType: String {
    
    case pushMapBinder = "Push With map + Binder"
    
    case pushWrapBinder = "Push With wrap + Binder"
    
    case presentMapBinder = "Present With map + Binder"
    
    case presentWrapBinder = "Present With wrap + Binder"
    
    case pushMapSubscribe = "Push With map + Subscribe"
    
    case pushWrapSubscribe = "Push With wrap + Subscribe"
    
    case presentMapSubscribe = "Present With map + Subscribe"
    
    case presentWrapSubscribe = "Present With wrap + Subscribe"
}
