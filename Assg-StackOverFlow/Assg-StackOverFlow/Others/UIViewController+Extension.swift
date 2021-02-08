//
//  UIViewController+Extension.swift
//  Assg-StackOverFlow
//
//  Created by Dinesh Danda on 2/8/21.
//  Copyright © 2021 Dinesh Danda. All rights reserved.
//

import Foundation
import MBProgressHUD

extension UIViewController {

    func showHUD(progressLabel:String){
        DispatchQueue.main.async{
            let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHUD.label.text = progressLabel
        }
    }

    func dismissHUD(isAnimated:Bool) {
        DispatchQueue.main.async{
            MBProgressHUD.hide(for: self.view, animated: isAnimated)
        }
    }
}

