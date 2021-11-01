//
//  SecondView.swift
//  API
//
//  Created by Mohammed Alsaleh on 26/03/1443 AH.
//

import SwiftUI

struct SecondView: View {
    @Binding var indexQ : Int
    var answers : [String]
    var question : String
    var answersINdex : Int
    @State var isTrue : Int = 5
    @State var isFalse : [Int] = []
    @ObservedObject var VM = ViewModel()
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9826856256, green: 0.9201651812, blue: 0.8403014541, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                
                Text(question)
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.5029919147, green: 0.2726653218, blue: 0.07366804034, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(.top , UIScreen.main.bounds.height / 8)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity , maxHeight: 300)
                VStack{
                    ForEach(Array(zip(answers.indices,answers)), id: \.0) { (index , data) in
                        Button(action: {
                            if index == answersINdex {
                                isTrue = index
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    self.indexQ += 1
                                }
                            } else {
                                isFalse.append(index)
                            }
                        }, label: {
                            Rectangle()
                                .foregroundColor(Color(#colorLiteral(red: 0.9436230063, green: 0.6093814969, blue: 0.3334983587, alpha: 1)))
                                .cornerRadius(15)
                                .frame(width: UIScreen.main.bounds.width - 70, height: 70)
                                .overlay(isFalse.contains(Int(index)) ? Color.red.cornerRadius(15) : Color.clear.cornerRadius(15))
                                .overlay(isTrue == index ? Color(#colorLiteral(red: 0.210388869, green: 0.6612430215, blue: 0.4988952279, alpha: 1)).cornerRadius(15) : Color.clear.cornerRadius(15))
                                .overlay(Text(data).font(.system(size: 25, weight: .semibold, design: .rounded)).foregroundColor(.white))
                        })
                        
                    }
                    
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.6, alignment: .center)
                
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
    }
}

