public struct NDChart {
  public let title: String
  public let lines: [Any]

  public init(fromString nashdownString: String) {
    title = "A Song"

    lines = try! NDLinesParser.parse(nashdownString)
  }
}
