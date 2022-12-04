//
//  ListRowView.swift
//  IconSplashSwiftUI
//
//  Created by Tiara H on 04/12/22.
//

import SwiftUI

struct ListRowView: View {
    // MARK: -PROPERTIES
    var loan: Loan
    
    
    // MARK: -BODY
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(loan.name)
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.bold)
                
                Text(loan.country)
                    .font(.system(.subheadline, design: .rounded))
                
                Text(loan.use)
                    .font(.system(.body, design: .rounded))
                
                
            } //: VSTACK
            Spacer()
            Text("$\(loan.amount)")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            
        } //: HSTACK
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}
    
    // MARK: -PREVIEW
    struct ListRowView_Previews: PreviewProvider {
        static var previews: some View {
            ListRowView(loan: Loan(name: "Russel", country: "rusia", use: "To buy a house for my house", amount: 876))
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }

