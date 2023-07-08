//
//  AuthViewModel.swift
//  Instargram
//
//  Created by Andrew on 2023/07/08.
//

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        email?.isEmpty == false && password?.isEmpty == false
    }
    
}

struct RegistrationViewModel {
    
}
