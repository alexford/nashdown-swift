public struct NDChart {
  public let title: String
  public let lines: [NDLine]

  public init(fromString nashdownString: String) throws {
    title = "A Song"

    lines = try NDLinesParser.parse(nashdownString)
  }
}
