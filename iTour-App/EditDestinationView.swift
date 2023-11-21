//
//  EditDestinationView.swift
//  iTour-App
//
//  Created by Aleksandr Morozov on 17/11/23.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    
    @Bindable var destination : DestinationModel
    @State private var newSightName = ""
    
    var body: some View {
        Form {
            
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority"){
                Picker("Priority", selection: $destination.priority){
                    Text("Meh")
                        .tag(1)
                    Text("Maybe")
                        .tag(2)
                    Text("Must")
                        .tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("Sights"){
                ForEach(destination.sights) { sight in
                    Text(sight.name) 
                }
                
                HStack{
                    
                    TextField("Add a new sight in \(destination.name)", text : $newSightName)
                    
                    Button("Add", action: addSight)
                    
                }
            }
            
        }
        .navigationTitle("Edit Description")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight() {
        
        guard newSightName.isEmpty == false else {
            return
        }
        
        withAnimation {
            let sight = Sight(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
    }
}

#Preview {
    
    //creating custom context for the preview.
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: DestinationModel.self, configurations: config)
        let example = DestinationModel(name: "Example Destination", details: "Example Details")
        
        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
