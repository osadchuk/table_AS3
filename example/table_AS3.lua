--[[
	Copyright (c) 2011 the original author or authors

	Permission is hereby granted to use, modify, and distribute this file
	in accordance with the terms of the license agreement accompanying it.
--]]

module (..., package.seeall)

function table.concat_as3(self, ...)
	assert(type(self) == "table", "Error: table.concat_as3 must be called on a table")
	local newTable = {}
	-- copy original table
	for i, v in ipairs(self) do
		newTable[i] = v
	end
	if not ... then
		return newTable
	end
	-- get varargs
	local values
	if type(...) == "table" then
		values = ...
	else
		values = {...}
	end
	-- append to newTable
	for i, v in ipairs(values) do
		newTable[#newTable + 1] = v
	end
	return newTable
end

function table.indexOf(self, searchElement, fromIndex)
	assert(type(self) == "table", "Error: table.indexOf must be called on a table")
	fromIndex = fromIndex or 0
	for i = fromIndex, #self do
		if self[i] == searchElement then
			return i
		end
	end
	return -1
end

function table.lastIndexOf(self, searchElement, fromIndex)
	assert(type(self) == "table", "Error: table.lastIndexOf must be called on a table")
	fromIndex = fromIndex or #self
	for i = fromIndex, 1, -1 do
		if self[i] == searchElement then
			return i
		end
	end
	return -1
end

function table.pop(self)
	assert(type(self) == "table", "Error: table.pop must be called on a table")
	return table.remove(self)
end

function table.push(self, ...)
	assert(type(self) == "table", "Error: table.push must be called on a table")
	for i, v in ipairs{...} do
		self[#self + 1] = v
	end
	return #self
end

function table.reverse(self)
	assert(type(self) == "table", "Error: table.reverse must be called on a table")
	local newTable = {}
	for i, v in ipairs(self) do
		table.insert(newTable, 1, v)
	end
	for i, v in ipairs(newTable) do
		self[i] = v
	end
end

function table.shift(self)
	assert(type(self) == "table", "Error: table.shift must be called on a table")
	return table.remove(self, 1)
end

function table.slice(self, startIndex, stopIndex)
	assert(type(self) == "table", "Error: table.slice must be called on a table")
	local newTable = {}
	startIndex = startIndex or 0
	stopIndex = stopIndex or #self
	if stopIndex < 0 then
		stopIndex = #self + stopIndex
	end
	for i = startIndex, stopIndex do
		newTable[#newTable + 1] = self[i]
	end
	
	return newTable
end

function table.splice(self, startIndex, deleteCount, ...)
	assert(type(self) == "table", "Error: table.splice must be called on a table")
	if startIndex < 0 then
		startIndex = #self + startIndex
	end
	for i = 1, deleteCount do
		table.remove(self, startIndex)
	end
	if ... then
		for i, v in ipairs{...} do
			table.insert(self, startIndex, v)
			startIndex = startIndex + 1
		end
	end
end

function table.unshift(self, ...)
	assert(type(self) == "table", "Error: table.unshift must be called on a table")
	local valuesToAdd = {...}
	for i = #valuesToAdd, 1, -1 do
		table.insert(self, 1, valuesToAdd[i])
	end
	return #self
end