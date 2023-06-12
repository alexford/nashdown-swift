public struct NDChart {
  public let title: String?
  //public let lines: [NDLine]
  public let sections: [NDSection]

  public init(fromString nashdownString: String) throws {
    // if let parsedTitle = NDFrontMatterParser.parse(nashdownString) {
    //   title = String(parsedTitle)
    // } else {
    //   title = nil
    // }
    title = "foo"

    //sections = try NDSectionsByBlocksParser.parse(nashdownString)


    sections = try nashdownString.components(separatedBy: "\n\n").map { sectionString in
      try NDSectionParser.parse(sectionString)
    }
  }
}
