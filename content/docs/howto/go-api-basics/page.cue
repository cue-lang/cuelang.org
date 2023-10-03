package site

content: docs: howto: "go-api-basics": {
	page: comparators: [
		{
			kind:    "patternComparator"
			command: "go test"
			pattern: expr: #"(?m)^ok .*\t(\d(\.\d+)?)s"#
		},
		{
			kind:    "unstableLineOrderComparator"
			command: "go test"
		},
	]
}
