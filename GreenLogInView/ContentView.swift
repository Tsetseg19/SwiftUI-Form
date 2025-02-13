//
//  ContentView.swift
//  GreenLogInView
//
//  Created by Enkhtsetseg Unurbayar on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userNameInput: String = "" // State variable for username input
    @State private var passwordInput: String = "" // State variable for password input
    
    var body: some View {
        VStack {
            LogInView(userNameInput: $userNameInput, passwordInput: $passwordInput) // Pass Binding for both username and password
        }
        .padding()
    }
}

// Preview for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
