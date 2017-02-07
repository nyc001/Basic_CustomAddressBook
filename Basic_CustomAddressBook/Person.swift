//
//  Person.swift
//  Basic_CustomAddressBook
//
//  Created by hhh on 2017-01-18.
//  Copyright © 2017 hhh. All rights reserved.
//

import Foundation

enum PersonaValidationError: Error {
    case InvalidFirstName
    case InvalidLastName
    case InvalidAddress
    case InvalidPhoneNumber
    case InvalidEmail
}

class Person {
    private(set) var firstName: String?
    private(set) var lastName: String?
    private(set) var address: String?
    private(set) var phoneNumber: String?
    private(set) var email: String?

    init?(initFirstName firstName: String) {

        do {
            try setFirstName(firstName: firstName)
        } catch {
            return nil
        }
    }

    func setFirstName(firstName: String) throws {
        if firstName.characters.count < 1 {
            throw PersonaValidationError.InvalidFirstName
        }
        self.firstName = firstName
    }

    func setLastName(lastName: String) {
        self.lastName = lastName
    }

    func setAddress(address: String) throws {
        let addressCount = address.characters.count
        if addressCount != 0 {
            if addressCount < 3 {
                throw PersonaValidationError.InvalidAddress
            }
            if let _ = address.characters.index(of: " ") {
                //Contain space of address do nothing
            } else {
                throw PersonaValidationError.InvalidAddress
            }
        }
        self.address = address
    }

    func setPhoneNumber(phoneNumber: String) throws {
        if phoneNumber.characters.count != 0 {
            let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            let phoneTestResult = phoneTest.evaluate(with: phoneNumber)
            if !phoneTestResult {
                throw PersonaValidationError.InvalidPhoneNumber
            }
        }

        self.phoneNumber = phoneNumber
    }

    func setEmail(email: String) throws {
        if email.characters.count != 0 {
            let EMAIL_REGREX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", EMAIL_REGREX)
            let emailTestResult = emailTest.evaluate(with: email)
            if !emailTestResult {
                throw PersonaValidationError.InvalidEmail
            }
        }
        self.email = email
    }
}
