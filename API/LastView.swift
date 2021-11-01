//
//  LastView.swift
//  API
//
//  Created by Mohammed Alsaleh on 26/03/1443 AH.
//

import SwiftUI

struct LastView: View {
    @Binding var Index : Int
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9826856256, green: 0.9201651812, blue: 0.8403014541, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 100))
                    .foregroundColor(Color(#colorLiteral(red: 0.210388869, green: 0.6612430215, blue: 0.4988952279, alpha: 1)))
                    .padding()
                Text("إنتهى الإختبار.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 0.5029919147, green: 0.2726653218, blue: 0.07366804034, alpha: 1)))
                Button {
                    Index = 0
                } label: {
                    Text("إعادة الإختبار")
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 70, height: 70)
                        .cornerRadius(15)
                        .background(Color(#colorLiteral(red: 0.210388869, green: 0.6612430215, blue: 0.4988952279, alpha: 1)).frame(width: UIScreen.main.bounds.width - 70, height: 70).cornerRadius(15))
                        .padding()
                }

            }
        }
    }
}

