//
//  ServingStepper.swift
//  FruitsHealthyApp
//
//  Created by Z.K   on 27/08/2026.
//

import SwiftUI

// MARK: - Serving Stepper
// A reusable stepper component for adjusting serving count
struct ServingStepper: View {
    @Binding var servings: Int   // Bound to parent state

    var body: some View {
        HStack {
            // MARK: - Label
            Text("Servings")
                .font(.bodyText.bold())

            Spacer()

            // MARK: - Stepper Controls
            HStack(spacing: 16) {
                // Decrement button
                Button {
                    if servings > 1 { servings -= 1 }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 26))
                        .foregroundColor(.appGreen)
                }

                // Current value
                Text("\(servings)")
                    .font(.h2)
                    .frame(minWidth: 24)

                // Increment button
                Button {
                    servings += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 26))
                        .foregroundColor(.appGreen)
                }
            }
        }
        .padding(16)
        .background(Color.appCard)
        .cornerRadius(16)
    }
}
