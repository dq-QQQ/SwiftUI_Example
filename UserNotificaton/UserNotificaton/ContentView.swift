//
//  ContentView.swift
//  UserNotificaton
//
//  Created by Kyu jin Lee on 2022/09/17.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                    
                }
            }
            
            Button("Schedule Notification"){
                let content = UNMutableNotificationContent()
                content.title = "Study SwiftUI"
                content.subtitle = "User Notification"
                content.sound = UNNotificationSound.default
                
                var dateComponents = DateComponents()
                dateComponents.year = 2022
                dateComponents.month = 09
                dateComponents.day = 17
                dateComponents.hour = 9
                dateComponents.timeZone = TimeZone(identifier: "Korea/Seoul")
                print(Calendar(identifier: .gregorian).date(from: dateComponents))
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
