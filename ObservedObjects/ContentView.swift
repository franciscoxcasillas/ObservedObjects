//
//  ContentView.swift
//  ObservedObjects
//
//  Created by Francisco Jean on 11/03/25.
//

import SwiftUI

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
}

struct ContentView: View {
    
    @StateObject private var ViewModel = CounterViewModel()
    
    var body: some View {
        SecondView(ViewModel: ViewModel)
    }
}

struct SecondView: View {
    
    @ObservedObject var ViewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Text("\(ViewModel.count)")
                .font(.largeTitle)
            HStack {
                Button("Increment"){
                    ViewModel.increment()
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .frame(width: 150)
                Button("Decrement"){
                    ViewModel.decrement()
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .frame(width: 150)
            }
        }
    }
}

#Preview {
    ContentView()
}
