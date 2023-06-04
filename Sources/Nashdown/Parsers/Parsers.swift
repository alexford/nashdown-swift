import Parsing

public let NDLinesParser = Parse(input: Substring.self) {
  Many {
    NDLineParser
  } separator: {
    "\n"
  }
}

public let NDLineParser = Parse(input: Substring.self, NDLine.init(items:)) {
  Many {
    NDBarParser
  } separator: {
    Not { "\n" }
    Whitespace()
  }
}

public let NDBarParser = Parse(input: Substring.self) {
  Many(1...) {
    NDChordParser
  } separator: {
    "_"
  }.map {
    NDBar(chords: $0)
  }
}

public let QualityParser = Parse(input: Substring.self) {
  "-".map { NDChordQuality.Minor }
}.replaceError(with: NDChordQuality.Major )

public let NDChordParser = Parse(input: Substring.self) {
  Digits(1)
  QualityParser
}.map {
  NDChord($0, $1)
}
