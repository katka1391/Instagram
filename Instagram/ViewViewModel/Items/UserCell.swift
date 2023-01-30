//
//  UserCell.swift
//  Instagram
//
//  Created by katka.slivova on 30/01/2023.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("slivova")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            VStack (alignment: .leading) {
                Text("katka")
                    .font(.system(size: 15, weight: .semibold))
                Text("Katarina Slivova")
                    .font(.system(size: 15))
            }
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
