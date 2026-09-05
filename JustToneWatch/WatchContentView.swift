import SwiftUI

struct WatchContentView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "waveform")
                .accessibilityHidden(true)
            Text("JustTone")
                .font(.headline)
            Text("Ready")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}
