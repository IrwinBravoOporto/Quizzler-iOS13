//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by everis on 11/2/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let text:String
    let answr:[String]
    let ca:String
    
    init(q:String,a:[String],correctAnswer:String) {
        text = q
        answr = a
        ca = correctAnswer
    }
}
