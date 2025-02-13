//
//  LogInError.swift
//  GreenLogInView
//
//  Created by Enkhtsetseg Unurbayar on 2/11/25.
//

import Foundation

enum LogInError: LocalizedError {
    case usernameRequired
    case passwordRequired
    case passwordTooShort
    
    var errorDescription: String? {
        switch self {
        case .usernameRequired:
            return "Username is required"
        case .passwordRequired:
            return "Password is required"
        case .passwordTooShort:
            return "Password is too short"
        }
    
        
    }
}
