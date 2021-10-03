//
//  ViewControllerExtensions+.swift
//  MVVM_test
//
//  Created by Ercan Garip on 16.09.2021.
//

import UIKit

//MARK: - For Navigation
extension UIViewController {
    
    //MARK: - Find storyboard from VC
    func findStoryBoard(_ storyBoardName : AppStoryBoard) -> UIStoryboard{
        return UIStoryboard(name: storyBoardName.rawValue, bundle: nil)
    }
}

//MARK: - Alert
extension UIViewController {
    func showBasicAlert(
        title : String?,
        message : String?,
        style : UIAlertController.Style = .alert,
        actionTitle : String?,
        handler : ((UIAlertAction) -> Void)? = nil,
        actionStyle : UIAlertAction.Style = .default){
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: actionTitle, style: actionStyle, handler: handler)
        
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
}


