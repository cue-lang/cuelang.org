package site

content: docs: howto: "go-api-basics": {
	page: comparators: [
		{
			kind:    "patternComparator"
			command: "go test"
			pattern: {
				expr:     #"^ok .*\t(\d(\.\d+)?)s"#
				linewise: true
			}
		},
		{
			kind:    "unstableLineOrderComparator"
			command: "go test"
		},
	]
}
