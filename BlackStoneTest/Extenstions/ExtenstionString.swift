//
//  ExtenstionString.swift
//  DuppizleTest
//
//  Created by Tariq Maged on 13/11/2021.
//

import UIKit
extension String{
    func convertDateString( fromFormat sourceFormat : String, toFormat desFormat : String) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = sourceFormat
       let date = dateFormatter.date(from: self) ?? Date()
       dateFormatter.dateFormat = desFormat
       return dateFormatter.string(from: date)
   }
}
