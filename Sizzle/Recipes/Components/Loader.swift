//
//  Loader.swift
//  Sizzle
//
//  Created by Renzy Ortega on 10/21/23.
//

import SwiftUI

struct Loader: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
