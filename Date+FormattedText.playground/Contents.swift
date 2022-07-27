import UIKit

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened) // 12:54 PM
        if Locale.current.calendar.isDateInToday(self) {
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else {
            let dateText = formatted(.dateTime.month(.abbreviated).day()) // Jul 28
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText) // Jul 28 at 12:54 PM
        }
    }
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            return NSLocalizedString("Today", comment: "Today due date description")
        } else {
            return formatted(.dateTime.month().day().weekday(.wide)) // Thursday, Jul 28
        }
    }
}

var dueDate = Date().addingTimeInterval(80000.0) // the value to add in seconds
print(dueDate.dayAndTimeText) // Jul 28 at 12:54 PM

print(dueDate.dayText) // Thursday, Jul 28
