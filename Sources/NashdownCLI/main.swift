import Nashdown

print("CLI builds")

let nd = """
1- 2 3- 4
5 6 7_8 1
"""

let chart = NDChart(fromString: nd)

print(chart.lines)
