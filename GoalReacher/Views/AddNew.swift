//
//  AddNew.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI
import HorizonCalendar

struct AddNew: View {
    @EnvironmentObject var toDoItemsModel: ToDoViewModel
    @StateObject var toDoItemModel = ToDoViewModel()
    let calendarView = CalendarView(initialContent: makeContent())
    var body: some View {
        NavigationView{
            //ZStack{
                //Image("space")
                    //.resizable()
                    //.frame(width: 900, height: 900)
            VStack{
                TextField("Title", text: $toDoItemModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                Toggle("Add to Morning", isOn: $toDoItemModel.morninig)
                Toggle("Add to Evening", isOn: $toDoItemModel.evening)
                Toggle("Add to Todays must do", isOn: $toDoItemModel.todaysMustDo)
                Toggle("Remainder?", isOn: $toDoItemModel.wantsRemainer)
                    
                
                Spacer()
                
            }
                   
            }
                
        }
    }



private func makeContent() -> CalendarViewContent {
  let calendar = Calendar.current

  let startDate = calendar.date(from: DateComponents(year: 2023, month: 01, day: 01))!
  let endDate = calendar.date(from: DateComponents(year: 2025, month: 12, day: 31))!

  return CalendarViewContent(
    calendar: calendar,
    visibleDateRange: startDate...endDate,
    monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
}


struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
    }
}
