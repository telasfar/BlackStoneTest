//
//  Constants.swift
//  BlackStoneTest
//
//  Created by Tariq Maged on 28/01/2022.
//

import Foundation
class Constants{
    
    private static let CREAT_FEV_KEY = "CREAT_FEV_KEY"
   
    static var fevoriteArr: [Int] {
        get {
            return UserDefaults.standard.value(forKey: CREAT_FEV_KEY) as? [Int] ?? [Int]()
        } set {
            UserDefaults.standard.set(newValue, forKey: CREAT_FEV_KEY)
        }
    }
}
