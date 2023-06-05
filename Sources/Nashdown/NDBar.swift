import Foundation

public struct NDBar: Identifiable {
  public let chords: [NDChord]
  public let id = UUID()

  public init(chords newChords: [NDChord]) {
    self.chords = newChords
  }
}
