package site

content: docs: howto: "log-statistics-from-the-cue-evaluator": {
	page: comparators: [{
		kind:          "patternComparator"
		commandPrefix: "cat stats.cue"
		pattern: expr: #"(?m)\d+,?$"#
	}]
}
