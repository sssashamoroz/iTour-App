//
//  ContentView.swift
//  iTour-App
//
//  Created by Aleksandr Morozov on 17/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [DestinationModel]()
    @State private var sortOder = SortDescriptor(\DestinationModel.name)
    @State private var searchText = ""

    var body: some View {
        NavigationStack(path: $path){
            
            DestinationListingView(sort: sortOder, searchString: searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: DestinationModel.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar{
                    Button("Add Destination", systemImage: "plus", action: addDestination)
                    Menu("Sort", systemImage: "arrow.up.arrow.down"){
                        Picker("Sort", selection: $sortOder){
                            Text("Name")
                                .tag(SortDescriptor(\DestinationModel.name))
                            
                            Text("Priority")
                                .tag(SortDescriptor(\DestinationModel.priority, order: .reverse))
                            
                            Text("Date")
                                .tag(SortDescriptor(\DestinationModel.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    
    }
    
    
    func addSamples(){
        let rome = DestinationModel(name: "Rome")
        let florence = DestinationModel(name: "Florence")
        let naples = DestinationModel(name: "Naples")
        
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
    
    func addDestination(){
        let destination = DestinationModel()
        modelContext.insert(destination)
        path = [destination]
    }
    

    
}

#Preview {
    ContentView()
}
