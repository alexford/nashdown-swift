import Foundation

public struct NDChord: Identifiable {
  public let degree: Int
  public let quality: NDChordQuality
  public let id = UUID()

  public var isMinor: Bool {
    return self.quality == NDChordQuality.Minor
  }

  public var isMajor: Bool {
    return !self.isMinor
  }

  public init(_ degree: Int, _ quality: NDChordQuality) {
    self.degree = degree

    // TODO
    self.quality = quality
  }
}

public enum NDChordQuality {
  case Major
  case Minor
}
