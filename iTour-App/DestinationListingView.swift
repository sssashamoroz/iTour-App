//
//  DestinationListingView.swift
//  iTour-App
//
//  Created by Aleksandr Morozov on 20/11/23.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort:[SortDescriptor(\DestinationModel.priority, order: .reverse), SortDescriptor(\DestinationModel.name)]) var destinations: [DestinationModel]
    
    var body: some View {
        List{
            ForEach(destinations) { destination in
                NavigationLink(value : destination){
                    VStack(alignment: .leading){
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }
    
    init(sort: SortDescriptor<DestinationModel>, searchString : String){
                
        _destinations = Query(filter: #Predicate{
            if searchString.isEmpty{
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort]) //What is $0
    }
    
    func deleteDestinations(_ indexSet: IndexSet){
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
    
    
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\DestinationModel.name), searchString: "")
}
