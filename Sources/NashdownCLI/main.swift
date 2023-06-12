import Nashdown

print("CLI builds")

let nd = """
# Intro
1

# Bridge
1'''_2' 2 3- 4
1 2 3 4

2 6 7_8 1
2 2 3 4

3 3 3
3 3 3

4 4 4
4 4 4
"""

let chart = try! NDChart(fromString: nd)

// let title = NDFrontMatterParser.parse(fmonly)
// print(String(title))

print(chart.sections.count)
// print(chart.sections.first!.lines.count)

//print(chart.title ?? "Untitled")
//print(chart.sections.first!)
