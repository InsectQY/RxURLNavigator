//
//  LoginViewController.swift
//  RxURLNavigator_Example
//
//  Created by Insect on 2018/11/5.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tip = UILabel(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 60))
        tip.text = "Click back"
        tip.textAlignment = .center
        view.addSubview(tip)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let vcs = navigationController?.viewControllers else {return}
        
        if vcs.count > 1 && vcs[vcs.count - 1] == self {
            navigationController?.popViewController(animated: true)
        }else {
            dismiss(animated: true, completion: nil)
        }
    }
}
