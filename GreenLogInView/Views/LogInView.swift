//
//  LogInView.swift
//  GreenLogInView
//
//  Created by Enkhtsetseg Unurbayar on 2/11/25.
//

import SwiftUI

struct LogInView: View {
    
    @Binding var userNameInput: String
    @Binding var passwordInput: String
    
    @State var viewModel = LogInViewModel()
    @State private var usernameError: Bool = false
    @State private var passwordError: Bool = false
    @State private var validationColor: Color = .green
    
    @FocusState private var focusedfield: Field?
    
    var body: some View {
        VStack(spacing: 20){
            
            Text("Log In")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
                .foregroundColor(.green)
                .padding()

            TextField("Username", text: $userNameInput)
//                .overlay(validationColor, in: RoundedRectangle(cornerRadius: 2)
//                    .stroke(lineWidth: 2))
                .focused($focusedfield, equals:.uerName)
               
                .onChange(of: userNameInput) { newValue in
                    // Validate username as the user types, and check if the value is empty
                    viewModel.validateUserName(userInput: newValue)
                    if newValue.isEmpty{
                        
                        viewModel.validateUserName(userInput: newValue)
                        usernameError = true
                      
                    }
                }
                .onSubmit {
                    viewModel.validateUserName(userInput: userNameInput)
                    if $viewModel.userNameError != nil {
                        usernameError = true
                    }
                    focusedfield = .password
                }
            
            // Display username error message if there's an error
            if usernameError {
                Text(viewModel.userNameError?.errorDescription ?? "")
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            // Password input field
            SecureField("Password", text: $passwordInput)
//                .overlay(validationColor, in: RoundedRectangle(cornerRadius: 8)
//                    .stroke(lineWidth: 2))
                .focused($focusedfield, equals: .password)
                .onChange(of: passwordInput) { newValue in
                    // Validate username as the user types, and check if the value is empty
                    viewModel.validatePassword(userInput: newValue)
                    if viewModel.userNameError != nil {
                        passwordError = true
                  
                    }
                }
                .onSubmit {
                    viewModel.validatePassword(userInput: passwordInput)
                    if viewModel.userNameError != nil {
                        passwordError = true
                    }
                }
            
            // Display password error message if there's an error
            if passwordError {
                Text(viewModel.passWordError?.errorDescription ?? "")
                    .foregroundColor(.red)
                    .font(.footnote)
            }
            
            // Log In button
            Button(action: {
                // Validate both username and password on button press
                viewModel.validateUserName(userInput: userNameInput)
                viewModel.validatePassword(userInput: passwordInput)

                // Check if there are no validation errors
                if viewModel.userNameError == nil && viewModel.passWordError == nil {
                    // Proceed with the login action (e.g., authenticate user)
                    print("Login successful for username: \(userNameInput)")
                } else {
                    // Handle failed login (optional)
                    print("Login failed due to validation errors.")
                    
                }
                
            }) {
                Text("Log In")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    
            }
            
            
        }
        .onAppear {
                focusedfield = .uerName
        }
        
    }
    
    enum Field: Hashable{
        case uerName, password
    }
}


// Preview for LogInView
struct LogInView_Previews: PreviewProvider {
    @State static var previewUserName = "testUser"
    @State static var previewPassword = "testPassword"
    
    static var previews: some View {
        LogInView(userNameInput: $previewUserName, passwordInput: $previewPassword)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
