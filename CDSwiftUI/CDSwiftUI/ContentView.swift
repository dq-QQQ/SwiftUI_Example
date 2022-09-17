//
//  ContentView.swift
//  ho
//
//  Created by Kyu jin Lee on 2022/09/09.
//

import SwiftUI

struct ContactView: View {
    let contact: Contact
    var body: some View {
        HStack {
            Text(contact.firstName ?? "-")
            Text(contact.lastName ?? "-")
            Spacer()
            Text(contact.phoneNumber ?? "-")
        }
    }
}

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: []
    ) var contacts: FetchedResults<Contact>
    @State private var isAddContactPresented = false
    private let coreDataStack = CoreDataStack(modelName: "ContactsModel")
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts, id: \.self) {
                    ContactView(contact: $0)
                }
                .onDelete(perform: deleteContact)
            }
            .listStyle(.plain)
            .navigationBarTitle("Contacts", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button {
                isAddContactPresented.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.headline)
            })
            .sheet(isPresented: $isAddContactPresented) {
                AddNewContact(isAddContactPresented: $isAddContactPresented)
                    .environmentObject(coreDataStack)
            }
        }
    }
    
    private func deleteContact(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }
        
        managedObjectContext.delete(contacts[index])
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
