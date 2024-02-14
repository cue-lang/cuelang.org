package site

content: docs: howto: "log-statistics-from-the-cue-evaluator": {
	page: comparators: [
		for prefix in ["cat stats.cue", "CUE_STATS_FILE=yaml:- cue vet file.cue"] {
			{
				kind:          "patternComparator"
				commandPrefix: prefix
				pattern: expr: #"(?m)\d+,?$"#
			}
		},
	]
}
