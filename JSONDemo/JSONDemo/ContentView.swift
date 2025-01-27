//
//  ContentView.swift
//  JSONDemo
//
//  Created by Vaishnavi Wahgule on 25/01/25.
//

// Questions :-
/**
 
 */
import SwiftUI

struct ContentView: View {
    private var people: [Person] = Person.allPeople
    
    var body: some View {
        NavigationView {
            List {
                ForEach(people, id: \.firstName) {
                    person in
                   // Text ("\(people.firstName)")
                    NavigationLink(destination: DetailView(person: person)){
                        VStack(alignment: .leading){
                            Text("\(person.firstName) \(person.surname)")
                            Text("\(person.phoneNumbers[0].number)")
                                .foregroundColor(.gray)
                        }
                        
                    }
                    .padding(6)
                }
                .navigationTitle("PhoneBook")
                    
                }
            }
        }
       
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
