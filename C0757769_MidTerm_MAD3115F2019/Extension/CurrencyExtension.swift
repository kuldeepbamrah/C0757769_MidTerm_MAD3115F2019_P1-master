//
//  CurrencyExtension.swift
//  C0757769_MidTerm_MAD3115F2019
//
//  Created by Kuldeep Singh on 2019-11-08.
//  Copyright © 2019 Kuldeep Singh. All rights reserved.
//

import Foundation
extension Float {
    func currFormat() ->String
    {
        // return "$\(self).00"
        return String(format: "$%0.2f", Float(self))
}
}
