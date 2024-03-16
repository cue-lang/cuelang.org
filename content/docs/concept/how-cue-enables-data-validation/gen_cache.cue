package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":          "G05dhVbHm7SGEHP9d0azAX9H7p3jhitH6rtP3zWh/Fk="
								"data: bryn (broken)": "TTZA5UDyqu4Fdm2jhhq8yIlCSHsc6zytM2lqqfx/Yqw="
								"data: charlie":       "xJ4xHsAZkiTTtlZ7X9gtBng4krHdEREONF+uB7T5eJc="
								"schema: CUE":         "S6cZxmCv6E4anN/NuK8CJb2+XeGbNiPfp683hACR25w="
								"data: bryn (fixed)":  "GglckvHNP6PaG92XkS/bWVCCu5PEyfd2i2iOjJUg54c="
							}
							code: {
								closedness: "/yZDQn57nRXbsaATfK7cODywKFhvn9u+lCN1G9x3upY="
							}
							multi_step: {
								hash:       "4U5NTVGF19KOB22EMJHOA80UP9KJQP9L3VIV05T0SME9MGEPVNVG===="
								scriptHash: "1TA98HDFQ8HKO2AEDUV3M4TI0NONI5H264FOSK12G8BPVSFU4BG0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.yml bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.yml bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
