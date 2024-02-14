package site

content: docs: howto: "log-statistics-from-the-cue-evaluator": {
	page: comparators: [
		for prefix in ["cat stats.cue", "cue export file.cue", "CUE_STATS_FILE=yaml:- cue export file.cue"] {
			{
				kind:          "patternComparator"
				commandPrefix: prefix
				pattern: expr: #"(?m)\d+,?$"#
			}
		},
	]
}
