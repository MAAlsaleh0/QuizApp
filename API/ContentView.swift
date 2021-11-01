//
//  ContentView.swift
//  API
//
//  Created by Mohammed Alsaleh on 25/03/1443 AH.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var VM = ViewModel()
    @State var Index = 0
    @State var Array : [Question] = []
    var body: some View {
        ZStack {
            if Index == 12 {
                LastView(Index: $Index)
            } else {
                ForEach(VM.JSONDataDecoder1 , id : \.self) { data in
                    
                    if Index == data.id {
                        SecondView(indexQ: $Index, answers: data.answers, question: data.question, answersINdex: data.correctIndex)
                    }
                }
            }
        }.onAppear(perform: {
            VM.GetData()
        })
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 13 Pro")
    }
}
