//
//  LogInViewModel.swift
//  GreenLogInView
//
//  Created by Enkhtsetseg Unurbayar on 2/11/25.
//
import SwiftUI

// LogInViewModel with validation logic using LogInError enum
class LogInViewModel: ObservableObject {
    
    @Published var userNameError: LogInError? = nil
    @Published var passWordError: LogInError? = nil
    
    // Validate username
    func validateUserName(userInput: String) {
        if userInput.isEmpty {
            userNameError = .usernameRequired
        } else {
            userNameError = nil
        }
    }
    
    // Validate password
    func validatePassword(userInput: String) {
        if userInput.isEmpty {
            passWordError = .passwordRequired
        } else if userInput.count < 4 {
            passWordError = .passwordTooShort
        } else {
            passWordError = nil
        }
    }
}

