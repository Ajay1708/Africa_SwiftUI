//
//  ContentView.swift
//  Africa_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 22/08/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [.init(.flexible())]
    @State private var gridColumn: Int = 2
    @State private var toolbarIcon: String = "square.grid.2x2"
    // MARK: - FUNCTIONS
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridColumn % 3 + 1)
        gridColumn = gridLayout.count
        switch gridColumn{
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // MARK: - BODY
    var body: some View {
        NavigationView{
            Group {
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals){ item in
                            NavigationLink {
                                AnimalDetailView(animal: item)
                            } label: {
                                AnimalListItemView(animal: item)
                            }
                        }//: LOOP
                        CreditsView().modifier(CenterModifer())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 12){
                            ForEach(animals) { animal in
                                NavigationLink.init(destination: {
                                    AnimalDetailView(animal: animal)
                                }, label: {
                                    AnimalGridItemView(animal: animal)
                                })
                            }//: LOOP
                        }//: VGRID
                    }//: SCROLLVIEW
                    .padding(10)
                    .animation(.easeIn, value: gridLayout.count)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem.init(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button.init {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // GRID
                        Button.init {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
