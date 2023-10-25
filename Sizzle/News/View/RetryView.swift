//
//  RetryView.swift
//  Sizzle
//
//  Created by Tayabas, Anthony Mark (Cognizant) on 10/20/23.
//

import SwiftUI

struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.bodyRegularSizzle)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Try again")
                    .font(.bodyRegularSizzle)
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(text: "An error ocurred") {
            
        }
    }
}

