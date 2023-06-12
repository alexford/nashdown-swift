import Foundation

public struct NDSection: Identifiable {
  public let id = UUID()

  public let name: String?
  public let lines: [NDLine]
}
