//
//  ContentView.swift
//  CustomProgressBarUsingSwiftUI
//
//  Created by Ramill Ibragimov on 07.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var percent: CGFloat = 0
    
    var body: some View {
        VStack {
            CustmoProgressView(percent: self.$percent)
        }.padding()
        .onTapGesture {
            self.percent = 0.75
        }.animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustmoProgressView: View {
    @Binding var percent: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .trailing) {
                Capsule()
                    .fill(Color.black.opacity(0.08))
                    .frame(height: 22)
                Text(String(format: "%.0f", self.percent * 100) + "%")
                    .font(.caption)
                    .foregroundColor(Color.gray.opacity(0.75))
                    .padding(.trailing)
            }
            Capsule()
                .fill(LinearGradient(gradient: .init(colors: [Color("Color1"), Color("Color2")]), startPoint: .leading, endPoint: .trailing))
                .frame(width: self.calPercent(), height: 22)
            
        }
        .padding(18)
        .background(Color.black.opacity(0.085))
        .cornerRadius(15)
    }
    
    func calPercent() -> CGFloat {
        let width = UIScreen.main.bounds.width - 66
        return width * self.percent
    }
}
