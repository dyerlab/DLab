import Cocoa

var str = "Hello, playground"


let i = 1
let columns = 10
let start = i*columns

let res = start ... start + columns - 1
print( res )

let rows = 10
let cols = 10

let values = Array(0...99)
print(values)

print("here it is")
print( (start ..< start).map { values[Int($0)] } )



let vals = stride(from:i, to:values.count, by: cols).map {values[$0]}
print(vals)

for x in stride(from: i, to: Int(rows*cols), by: cols) {
    print(x)
}








