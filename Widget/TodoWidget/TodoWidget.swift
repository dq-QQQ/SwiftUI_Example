//
//  TodoWidget.swift
//  TodoWidget
//
//  Created by Kyu jin Lee on 2022/08/12.
//

import WidgetKit
import SwiftUI


struct TaskEntry: TimelineEntry{
    let date: Date
    let task: TodoListModel
}


struct Provider: TimelineProvider{
    func placeholder(in context: Context) -> TaskEntry {
        TaskEntry(date: Date(), task:tasks[0])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TaskEntry) -> Void) {
        let entry = TaskEntry(date: Date(), task:tasks[0])
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [TaskEntry] = []
        let currentDate = Date()
        let filteredTasks = tasks.sorted(by: {$0.priority > $1.priority})
        for index in 0..<filteredTasks.count {
            let task = filteredTasks[index]
            let entryDate = Calendar.current.date(byAdding: .second, value: index*10, to: currentDate)!
            let entry = TaskEntry(date: entryDate, task:task)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
        
}

struct TodoWidgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack{
            Color("WidgetBackground")
                .ignoresSafeArea()
            Text(entry.task.description)
        }
    }
}

@main
struct TodoWidget: Widget {
    let kind: String = "TodoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: Provider()) { entry in
            TodoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Task List Widget")
        .description("Shows next pressing item on a todo list")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}


struct TodoWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TodoWidgetEntryView(entry: TaskEntry(date: Date(), task: tasks[0]))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            TodoWidgetEntryView(entry: TaskEntry(date: Date(), task: tasks[0]))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
 
        }
    }
}

//struct Provider: TimelineProvider {
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date())
//    }
//
//    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date())
//        completion(entry)
//    }
//
//    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//}
//
//struct TodoWidgetEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        Text(entry.date, style: .time)
//    }
//}
//
//@main
//struct TodoWidget: Widget {
//    let kind: String = "TodoWidget"
//
//    var body: some WidgetConfiguration {
//        StaticConfiguration(kind: kind, provider: Provider()) { entry in
//            TodoWidgetEntryView(entry: entry)
//        }
//        .configurationDisplayName("My Widget")
//        .description("This is an example widget.")
//    }
//}
//
//struct TodoWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoWidgetEntryView(entry: SimpleEntry(date: Date()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
