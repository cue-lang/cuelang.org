package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "NxI125L5xbhLKa3oqFzZmSnxRgZcI6TJYLMpWI7ujrM="
								"app-2.cue":  "YwLpf7hR8if6hzwyyKN7YCeXEL79fHAJF9apac14h2s="
								"app-3.cue":  "b/nBU6cY38GXcpYT7xfWaKIjqdqpSYgLTP4vMDpWRpE="
								"policy.cue": "6VPozv0PAgPMxyXlpYCHNgUhAGMxS5Tx6Qy8YnCbtEk="
							}
							code: {
								"order-irrelevance": "5E6MLtqELDwmhONUiObJyuFN7tQ6b6Sr+SWf4TguKyM="
								defaults:            "crKAtO4Z9RtBwo2TikI4Evnj69C2U7eoIfhvp6+hCoE="
								templates:           "ymdLnEwB/eRnnl6vn156pTf9l6THlqmRHsRTXfi8gS8="
							}
							multi_step: {
								"8PB9S44VINLOP5SONNQM8NSOR037C3KUO2IETLSLDHBLTGHTGSK0====": [{
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat app-1.cue"
									exitCode: 0
									output: """
											package config

											app: foo: {
											}

											"""
								}, {
									doc:      ""
									cmd:      "cat app-2.cue"
									exitCode: 0
									output: """
											package config

											app: bar: {
											\tport: 9999
											}

											"""
								}, {
									doc:      ""
									cmd:      "cat app-3.cue"
									exitCode: 0
									output: """
											package config

											app: baz: {
											}

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
