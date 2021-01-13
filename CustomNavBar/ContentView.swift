//
//  ContentView.swift
//  CustomNavBar
//
//  Created by Tim Lee on 1/13/21.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    @State var selectedIndex = 0
    @State var shouldShowModal = false
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowModal, content: {
                        Button(action: {
                            shouldShowModal.toggle()
                        }, label: {
                            Text("Fullscreen Cover")
                        })
                        
                    })
                
                switch selectedIndex {
                case 0:
                    NavigationView {
                        ScrollView {
                            ForEach(0..<100) { num in
                                Text("\(num)")
                            }
                        }
                        .navigationTitle("First Tab")
                    }
                case 1:
                    NavigationView {
                        Text("Second Tab")
                            .navigationTitle("Second Tab")
                    }
                case 2:
                    NavigationView {
                        Text("Third Tab")
                            .navigationTitle("Third Tab")
                    }
                case 3:
                    NavigationView {
                        Text("Fourth Tab")
                            .navigationTitle("Fourth Tab")
                    }
                case 4:
                    NavigationView {
                        Text("Fifth Tab")
                            .navigationTitle("Fifth Tab")
                    }
                default:
                    Text("Remaining tabs")
                }
            }
            
            
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        selectedIndex = num
                        if num == 2 {
                            shouldShowModal.toggle()
                            return
                        }
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) : .init(white: 0.8))
                        }
                        
                        Spacer()
                    })
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
