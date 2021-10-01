//
//  StoryBoard.swift
//  MVVM_test
//
//  Created by Ercan Garip on 16.09.2021.
//

import Foundation
import UIKit

extension UIStoryboard {

    func instantiate<T : UIViewController>(vc : T.Type,creator: ((NSCoder) -> UIViewController?)? = nil) -> T{
        
        return instantiateViewController(identifier: String(describing: vc.self),creator: creator) as! T
    }
}
