//
//  UserModifiableLayout.swift
//  SwiftUIPhotoGrid
//
//  Created by Tomas Havlicek on 04.11.2021.
//

import SwiftUI

struct UserModifiableLayout: View {
    
    @State var gridLayout: [GridItem] = [ GridItem() ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(samplePhotos.indices) { index in
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: gridLayout.count == 1 ? 200 : 100)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring())
            }
            .navigationTitle("Coffee Feed")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 4 + 1)
                    }, label: {
                        Image(systemName: "square.grid.2x2")
                            .font(.title)
                            .foregroundColor(.primary)
                    })
                }
            }
        }
    }
}

struct UserModifiableLayout_Previews: PreviewProvider {
    static var previews: some View {
        UserModifiableLayout()
    }
}
