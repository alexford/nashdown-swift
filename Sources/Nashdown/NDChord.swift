public struct NDChord {
  public let degree: Int
  public let quality: NDChordQuality

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
