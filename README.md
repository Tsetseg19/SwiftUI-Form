# SwiftUI MVVM Login

This project demonstrates how to implement a **login screen** using the **MVVM (Model-View-ViewModel)** architecture in **SwiftUI**. It includes validation for the **username** and **password** fields, and displays appropriate error messages if validation fails.

## Architecture

- **Model**: The `User` struct holds the user's data, including `userName` and `password`.
- **ViewModel**: The `LogInViewModel` handles the logic for validating the username and password.
- **View**: The `LogInView` represents the UI components, which interact with the ViewModel to perform validation and display error messages.

## Features

- **Username Validation**: Ensures that the username field is not empty.
- **Password Validation**: Checks if the password is not empty and contains at least 4 characters.
- **Error Handling**: Displays specific error messages when the username or password validation fails.
- **Responsive UI**: The app provides visual feedback to users based on input validation.

## Files Overview

- **Model**: `User` struct with `userName` and `password`.
- **ViewModel**: `LogInViewModel` that validates input for username and password and provides error messages.
- **View**: `LogInView` that contains the UI for user input and validation.



## Usage

- **Username**: Enter a username in the provided field.
- **Password**: Enter a password (minimum 4 characters).
- **Log In**: Press the "Log In" button to trigger validation.
  - If the username or password is invalid, error messages will appear.
  - If both inputs are valid, a success message will be printed to the console.

## Contributing

Feel free to fork this project and contribute! If you find any issues or have suggestions for improvements, please create an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

