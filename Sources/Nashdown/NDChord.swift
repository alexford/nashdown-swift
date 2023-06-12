import Foundation

public struct NDChord: Identifiable {
  public let degree: Int
  public let quality: NDChordQuality
  public let id = UUID()
  public let notatedBeats: Int?

  public var isMinor: Bool {
    return self.quality == NDChordQuality.Minor
  }

  public var isMajor: Bool {
    return !self.isMinor
  }

  public init(_ degree: Int, _ quality: NDChordQuality, _ beats: Int? = nil) {
    self.degree = degree
    self.quality = quality
    self.notatedBeats = beats
  }
}

public enum NDChordQuality {
  case Major
  case Minor
}
