import Parsing

// public let NDFrontMatterParser = Parse(input: Substring.self) {
//   "---\n"
//   PrefixUpTo("\n")
//   "\n---\n"
// }.replaceError(with: Substring("Untitled"))

public let NDSectionParser = Parse(input: Substring.self) {
  Optionally {
    "# "
    PrefixUpTo("\n")
  }
  Many {
    NDLineParser
  } separator: {
    Whitespace(1, .vertical)
  }
}.map { (name: Substring?, lines: [NDLine]) in
  let filteredLines = lines.filter { line in
    line.bars.count > 0
  }

  var theName: String?
  if let parsedName = name {
    theName = String(parsedName)
  }

  return NDSection(name: theName, lines: filteredLines)
}

public let NDLineParser = Parse(input: Substring.self, NDLine.init(bars:)) {
  Many {
    NDBarParser
  } separator: {
    Whitespace(.horizontal)
  }
}

public let NDBarParser = Parse(input: Substring.self, NDBar.init(chords:)) {
  Many(1...) {
    NDChordParser
  } separator: {
    //Not { "\n" }
    "_"
  }
}

public let NDChordQualityParser = Parse(input: Substring.self) {
  "-".map { NDChordQuality.Minor }
}.replaceError(with: NDChordQuality.Major )

public let NDTickParser = Parse(input: Substring.self) {
  Many(0...) {
    "'"
  }.map {
    $0.count
  }
}

public let NDChordParser = Parse(input: Substring.self) {
  Digits(1)
  NDChordQualityParser
  NDTickParser
}.map {
  NDChord($0, $1, $2 > 0 ? $2 : nil)
}
