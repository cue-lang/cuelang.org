// Structs and lists are composite types, composed of
// "fields" (structs) and "elements" (lists).
// Structs are indicated by { and }, and lists by [ and ].

// aStruct is a struct.
aStruct: {
	a: 1
	b: 2.0
	c: "3"
	d: {
		e: 4 + 4
		f: 5 * 5.0
	}
	g: false
}

// aList is a list.
aList: [
	1,
	2.0,
	"3",
	{
		e: 4 + 4
		f: 5 * 5.0
	},
	false,
]
