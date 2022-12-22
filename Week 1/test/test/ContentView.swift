//
//  ContentView.swift
//  test
//
//  Created by Bui The An on 2022/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3)
            Text("Hello, world!")
        }).foregroundColor(Color.red)
            .padding(10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
