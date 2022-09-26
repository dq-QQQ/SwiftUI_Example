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
//                let attachment = try! UNNotificationAttachment(identifier: UUID().uuidString, url: URL(string: "https://firebasestorage.googleapis.com/v0/b/dqapp-d00bb.appspot.com/o/empty.jpg?alt=media&token=82c55199-507b-41e5-9275-07e72bff42d4")!, options: .none)
//                content.attachments = [attachment]
                
                let ret = divideExpireDate()
                var dateComponents = DateComponents()
                dateComponents.year = ret[0]
                dateComponents.month = ret[1]
                dateComponents.day = ret[2]
                dateComponents.hour = ret[3]
                dateComponents.minute = ret[4]
                
                let date = Calendar(identifier: .gregorian).date(from: dateComponents)
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "ko_KR")
                dateFormatter.dateFormat = "YYYY년 MM월dd일 HH시mm분"
                
                
                print(dateFormatter.string(from: date!))
                print()
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                
            }
        }
        
    }
    
    let expireDate = "202209180118"
    func divideExpireDate() -> [Int] {
        var ret: [Int] = []
        var tmp = 3
        var i = 0
        while(i < expireDate.count) {
            ret.append(Int(expireDate.substring(from: i, to: i + tmp)) ?? 0)
            i += tmp + 1
            tmp = 1
        }
        return ret
    }
}

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1)
        
        return String(self[startIndex ..< endIndex])
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
