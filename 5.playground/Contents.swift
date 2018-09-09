//: Playground - noun: a place where people can play

import Foundation

func readInput() -> String {
	let file = "input.txt" //this is the file. we will write to and read from it

	let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

	let fileURL = dir.appendingPathComponent(file)

	return try! String(contentsOf: fileURL, encoding: .utf8)
}

let input = readInput()

var lines: [String] = []
input.enumerateLines { line, _ in
	lines.append(line)
}

var jumps: [Int] = lines.lazy
	.filter {!$0.isEmpty}
	.map {Int($0)!}

var offsets = Array(repeating: 0, count: jumps.count)

var currentIndex = 0
var counter = 0
while currentIndex < jumps.count {
	let curJump = jumps[currentIndex]
	jumps[currentIndex] += 1
	currentIndex += curJump
	counter += 1
}
print(counter)

