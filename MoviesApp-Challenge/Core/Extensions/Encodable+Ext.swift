//
//  EncodableExtension.swift
//  MVVM_test
//
//  Created by Ercan Garip on 17.09.2021.
//

import Foundation

extension Encodable {
    var toData : Data?{
        return try? JSONEncoder().encode(self)
    }
}
