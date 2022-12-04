//
//  LoanListView.swift
//  IconSplashSwiftUI
//
//  Created by Tiara H on 04/12/22.
//

import SwiftUI

struct LoanListView: View {
    // MARK: -PROPERTIES
  @ObservedObject var loanStore = LoanStore()
    
    // MARK: -BODY
    var body: some View {
        NavigationStack {
            List(loanStore.loans) { loan in
                ListRowView(loan: loan)
            }
            .task{
                self.loanStore.fetchLatesLoans()
            }
            .listStyle(.plain)
        }
        .padding()
    }
}



// MARK: -PREVIEW
struct LoanListView_Previews: PreviewProvider {
    static var previews: some View {
        LoanListView()
    }
}
