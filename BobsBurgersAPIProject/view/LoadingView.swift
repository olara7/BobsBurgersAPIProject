//
//  LoadingView.swift
//  BobsBurgersAPIProject
//
//  Created by Oscar Lara on 4/19/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Loading...")
            
            ProgressView()
                Text("getting the characters")
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
