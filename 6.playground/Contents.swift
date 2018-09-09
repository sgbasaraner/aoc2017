//: Playground - noun: a place where people can play

import Foundation

func readInput() -> String {
	let file = "input.txt"
	
	let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	
	let fileURL = dir.appendingPathComponent(file)
	
	return try! String(contentsOf: fileURL, encoding: .utf8)
}

let input = readInput()

var blocks = input.split(separator: "\t").map { Int($0)! }
let initialState = blocks
var states = [initialState]

var counter = 0
while true {
	var max = Int.min
	var index = 0
	for i in 0..<blocks.count {
		if blocks[i] > max {
			max = blocks[i]
			index = i
		}
	}
	blocks[index] = 0
	var iteration = index < blocks.count - 1 ? index + 1 : 0
	while max > 0 {
		blocks[iteration] += 1
		max -= 1
		iteration += 1
		if iteration == blocks.count { iteration = 0 }
	}
	counter += 1
	if states.contains(blocks) { break }
	states.append(blocks)
}

print(counter)
