import Foundation

public struct NDLine: Identifiable {
  public let bars: [NDBar]
  public let id = UUID()
}
