//
//  ContentView.swift
//  DataJSON
//
//  Created by Vaishnavi Wahgule on 25/01/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = ReadData()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(data.users) { info in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("ID:")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                Text(String(info.id))
                                    .font(.body)
                                    .foregroundColor(.blue)
                                
                                Spacer()
                                
                                Text("User ID:")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                Text(String(info.userID))
                                    .font(.body)
                                    .foregroundColor(.blue)
                            }
                            
                            Text(info.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .lineLimit(2)
                            
                            Text(info.body)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        )
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationTitle(" User Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
