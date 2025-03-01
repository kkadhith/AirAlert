import SwiftUI
import Testing
@testable import AirAlert

@Test func validateAlertBinding() async throws {
    let isShown = true
    let sample = SampleView(isShown: isShown)
    #expect(sample.isShown == true)
}

private struct SampleView: View {
    var isShown: Bool
    var body: some View {
        Button(action: {}) {
            Text("Validate Alert")
        }
        .airAlert(isPresented: .constant(isShown), title: "AirAlert Test", alertMessage: "Test Alert!", mainButtonLabel: "OK", secondButtonLabel: "Cancel", mainButtonAction: {}, secondButtonAction: {})
    }
}
