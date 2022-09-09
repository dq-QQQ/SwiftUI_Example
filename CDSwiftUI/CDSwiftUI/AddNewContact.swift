//
//  AddNewContact.swift
//  CDSwiftUI
//
//  Created by Kyu jin Lee on 2022/09/10.
//

import SwiftUI

struct AddNewContact: View {
    @EnvironmentObject
    var coreDataStack: CoreDataStack

    @Binding
    var isAddContactPresented: Bool
    @State
    var firstName = ""
    @State
    var lastName = ""
    @State
    var phoneNumber = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                Spacer()
            }
            .padding(16)
            .navigationTitle("Add A New Contact")
            .navigationBarItems(trailing:
                Button(action: saveContact) {
                    Image(systemName: "checkmark")
                        .font(.headline)
                }
                .disabled(isDisabled))
        }
    }

    private var isDisabled: Bool {
        firstName.isEmpty || lastName.isEmpty || phoneNumber.isEmpty
    }

    private func saveContact() {
        coreDataStack.insertContact(firstName: firstName,
                       lastName: lastName,
                       phoneNumber: phoneNumber)
        isAddContactPresented.toggle()
    }
}

