package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":               "G05dhVbHm7SGEHP9d0azAX9H7p3jhitH6rtP3zWh/Fk="
								"data: bryn (broken)":      "TTZA5UDyqu4Fdm2jhhq8yIlCSHsc6zytM2lqqfx/Yqw="
								"data: charlie":            "xJ4xHsAZkiTTtlZ7X9gtBng4krHdEREONF+uB7T5eJc="
								"schema: CUE":              "S6cZxmCv6E4anN/NuK8CJb2+XeGbNiPfp683hACR25w="
								"data: bryn (fixed)":       "GglckvHNP6PaG92XkS/bWVCCu5PEyfd2i2iOjJUg54c="
								"data: alex (reminder)":    "jKYrMiPm7jy7TbKB6oS72dL/xmCZ4pqsrj8u6dj/2dk="
								"data: bryn (reminder)":    "kKArtB8Oq6bjb2RwLtlRJ7fz3twnfvihFjybAf8Felk="
								"data: charlie (reminder)": "LhP6CEgqM9+R9fxLEaZmbGqW9BqIa3pgZ+3QxPhBE+Q="
								"schema: CUE (reminder)":   "0oLm74Tf1K/5Kt8x+0D83OndfLbRHNhiTpP6mwRho2Y="
							}
							code: {
								closedness: "/yZDQn57nRXbsaATfK7cODywKFhvn9u+lCN1G9x3upY="
							}
							multi_step: {
								hash:       "9225142DDGIKM31C5URGEP9856UV6T6FI2RS7QGHCGHVE6LIGUQG===="
								scriptHash: "KJ4AAJJEDNMV281ADUQE071TVJ9VHARV08CEV60N717JAMPU52L0===="
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
