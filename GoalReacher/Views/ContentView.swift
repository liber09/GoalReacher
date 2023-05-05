//
//  ContentView.swift
//  GoalReacher
//
//  Created by Linda Bergsängel on 2023-05-05.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let GoalReacherVm = GoalReacherVM()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Image("space")
                        .resizable()
                        .frame(width: 900, height: 900)
                    VStack(alignment: .center, spacing: 30){
                        Text(GoalReacherVm.getInfoAboutToday())
                            .foregroundColor(Color.white)
                            .font(.system(size: 20))
                        NavigationLink(destination: MorningView()) {
                            HStack{
                                Image("star")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(20)
                                
                                    Text("Morning")
                                        .font(.system(size: 36))
                                        .foregroundColor(Color.black)
                                
                                Image(systemName: "arrow.forward")
                                    .padding(20)
                                    .foregroundColor(Color.black)
                                
                            }
                            .background(Color.white)
                        }
                        NavigationLink(destination: EveningView()) {
                            HStack{
                                Image("star")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(20)
                                
                                Text("Evening")
                                    .font(.system(size: 36))
                                    .foregroundColor(Color.black)
                                
                                Image(systemName: "arrow.forward")
                                    .padding(20)
                                    .foregroundColor(Color.black)
                                
                            }
                            .background(Color.white)
                        }
                        NavigationLink(destination: MustDoTodayView()) {
                            HStack{
                                Image("star")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(20)
                                
                                Text("Must Do Today")
                                    .font(.system(size: 36))
                                    .foregroundColor(Color.black)
                                
                                Image(systemName: "arrow.forward")
                                    .padding(20)
                                    .foregroundColor(Color.black)
                            }
                            .background(Color.white)
                        }
                        NavigationLink(destination: AddNew()) {
                            Image(systemName: "plus.diamond.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(Color.white)
                        }
                    }
                    
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
