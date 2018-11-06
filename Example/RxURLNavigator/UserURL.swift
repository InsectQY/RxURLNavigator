//
//  UserURL.swift
//  SSDispatch
//
//  Created by insect_qy on 2018/8/18.
//  Copyright © 2018年 insect_qy. All rights reserved.
//

import URLNavigator

enum UserURL {
    case login
}

extension UserURL {
    
    var path: String {
        
        switch self {
            
        case .login:
            return "navigator://login"
        }
    }
    
    static func initRouter() {
        
        navigator.register(UserURL.login.path) { (_, _, _) in
            
            let vc = LoginViewController()
            vc.navigationItem.title = "Login"
            return vc
        }
    }
}
