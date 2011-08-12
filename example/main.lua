--[[

	Table_AS3: ActionScript 3 Array methods for Lua tables
	
	Examples of how to use the Table_AS3 module, which ports many
	of the ActionScript 3 methods of the Array class to Lua.
	
	Darren Osadchuk
	
	Twitter: 	http://twitter.com/DarrenOsadchuk
	Email		darren@ludicroussoftware.com
	Web			http://www.ludicroussoftware.com
	
	Copyright (c) 2011 the original author or authors

	Permission is hereby granted to use, modify, and distribute this file
	in accordance with the terms of the license agreement accompanying it.

--]]

require("table_AS3")

local tbl = {0, 1, 2, 3}

local function printTable(toPrint)
	toPrint = toPrint or tbl
	print(table.concat(toPrint, ", "))
end

-- push adds one or more elements to end of table and returns number of elements in new table
print("table.push(tbl, 4, 5, 6, 7)")
local tableLength = table.push(tbl, 4, 5, 6, 7)
printTable()
print("tableLength", tableLength)
print("\n")

-- pop removes last element from the table and returns that value
print("table.pop(tbl)")
local lastValue = table.pop(tbl)
printTable()
print("lastValue", lastValue)
print("\n")

-- shift removes the first element from the table and returns that value
print("table.shift(tbl)")
local firstValue = table.shift(tbl)
printTable()
print("firstValue", firstValue)
print("\n")

-- unshift adds one or more elements to beginning of table and returns
-- the new length of the table
print("table.unshift(tbl, -2, -1, 0)")
tableLength = table.unshift(tbl, -2, -1, 0)
printTable()
print("tableLength", tableLength)
print("\n")

-- slice returns a new table made up of elements from the original table;
-- the original table is not modified.
print("table.slice(tbl, 3, 5)")
local newTable = table.slice(tbl, 3, 5)
print("Original table:")
printTable()
print("Slice of original:")
printTable(newTable)
print("\n")

-- splice adds elements to and removes elements from the table.
-- The original table is modified
print("Before:")
printTable()
print("table.splice(tbl, 1, 2)")
table.splice(tbl, 1, 2)
printTable()
print("table.splice(tbl, 6, 2, 7, 8, 9)")
table.splice(tbl, 6, 2, 7, 8, 9)
printTable()
print("\n")

-- reverse reverses the table in place
print("table.reverse(tbl)")
table.reverse(tbl)
printTable()
print("\n")

-- indexOf searches for an element and returns the index
-- position of the first match. Returns -1 if not found.
print("table.indexOf(tbl, 3)")
print(table.indexOf(tbl, 3))
print("\n")

table.push(tbl, 3, 6, 4, 2, 4, 6, 3, 2)

-- lastIndexOf searches for an element and returns the index
-- position of the last match. Returns -1 if not found.
print("table.lastIndexOf(tbl, 6)")
print(table.lastIndexOf(tbl, 6))
print("\n")

-- concat_as3 concatenates the elements specified with the table
-- and returns a new table. If the argument is a table, then the
-- elements in the table are concatenated.
print("before concatenation:")
printTable()
print('table.concat_as3(tbl, "a", "b", "c")')
local concatenatedTable = table.concat_as3(tbl, "a", "b", "c")
printTable(concatenatedTable)
print("table.concat_as3(concatenatedTable, {'d', 'e', 'f'})")
concatenatedTable = table.concat_as3(concatenatedTable, {'d', 'e', 'f'})
printTable(concatenatedTable)