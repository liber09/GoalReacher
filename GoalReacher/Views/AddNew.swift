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
    @State private var tapMon:Bool = false
    @State private var tapTue:Bool = false
    @State private var tapWed:Bool = false
    @State private var tapThu:Bool = false
    @State private var tapFri:Bool = false
    @State private var tapSat:Bool = false
    @State private var tapSun:Bool = false
    var body: some View {
        NavigationView{
            //ZStack{
            //Image("space")
            //.resizable()
            //.frame(width: 900, height: 900)
            VStack{
                Text("Add new item")
                    .bold()
                    .font(.system(size: 28))
                Form {
                    
                    TextField("Title", text: $toDoItemModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    Toggle("Add to Morning", isOn: $toDoItemModel.morning)
                    Toggle("Add to Evening", isOn: $toDoItemModel.evening)
                    Toggle("Remainder?", isOn: $toDoItemModel.wantsRemainder)
                    
                    DatePicker("RemainderDate", selection: $toDoItemModel.remainderDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    Text("How many days is your goal?")
                    TextField("daysToDo", text:  $toDoItemModel.wantedDaysToDo)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                                     
                    HStack(spacing: 10){
                        Spacer()
                        
                        Text("Mon")
                            .onTapGesture {
                                if tapMon == false{
                                    tapMon = true
                                }else{
                                    tapMon = false
                                }
                            }
                            .foregroundColor(tapMon ? Color.white : Color.black)
                            .background(tapMon ? Color.blue : Color.white)
                        Text("Tue")
                            .onTapGesture {
                                if tapTue == false{
                                    tapTue = true
                                }else{
                                    tapTue = false
                                }
                            }
                            .foregroundColor(tapTue ? Color.white : Color.black)
                            .background(tapTue ? Color.blue : Color.white)
                        Text("Wed")
                            .onTapGesture {
                                if tapWed == false{
                                    tapWed = true
                                }else{
                                    tapWed = false
                                }
                            }
                            .foregroundColor(tapWed ? Color.white : Color.black)
                            .background(tapWed ? Color.blue : Color.white)
                        Text("Thu")
                            .onTapGesture {
                                if tapThu == false{
                                    tapThu = true
                                }else{
                                    tapThu = false
                                }
                            }
                            .foregroundColor(tapThu ? Color.white : Color.black)
                            .background(tapThu ? Color.blue : Color.white)
                        Text("Fri")
                            .onTapGesture {
                                if tapFri == false{
                                    tapFri = true
                                }else{
                                    tapFri = false
                                }
                            }
                            .foregroundColor(tapFri ? Color.white : Color.black)
                            .background(tapFri ? Color.blue : Color.white)
                        Text("Sat")
                            .onTapGesture {
                                if tapSat == false{
                                    tapSat = true
                                }else{
                                    tapSat = false
                                }
                            }
                            .foregroundColor(tapSat ? Color.white : Color.black)
                            .background(tapSat ? Color.blue : Color.white)
                        Text("Sun")
                            .onTapGesture {
                                if tapSun == false{
                                    tapSun = true
                                }else{
                                    tapSun = false
                                }
                            }
                            .foregroundColor(tapSun ? Color.white : Color.black)
                            .background(tapSun ? Color.blue : Color.white)
                        Spacer()
                      
                    }
                      
                            Button(action: {
                                toDoItemModel.save(title: toDoItemModel.title, wantsRemainder: toDoItemModel.wantsRemainder, lastDate: Date(), streakDays: 0, selectedDate: Date(), done: false, daysToDo: toDoItemModel.wantedDaysToDo)
                            }) {
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(Color.white)
                                    .padding(.leading)
                                Text("Save todo")
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                                    .padding([.top, .bottom, .trailing])
                            }
                            .background(Color(red: 255/255, green:16/255,blue: 240/255))
                            .cornerRadius(10.0)
                        }
                    }.onAppear() {
                }
                
            }
            
        }
    }
             
                         
struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
    }
}
