package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "1a9HVHcVJjBQ4z2nc2KRpWBe5xL+3Es8/BG82jmLyuU="
								"cue_types_gen.go 1":     "N+hmwn61jLM0qkKS7UHd0iOBnaj5DT7m+SLBG+jdzsg="
								"example 2":              "l/9ChMBjLQ1gSQQnVLjV+Xo4eTUVLtFAAK7P8iNKy3c="
								"cue_types_pet_gen.go 2": "6axMFY8AHpgbmnlDdxEGUD8PQCMrlp+FHDZ5FQ12Qyc="
							}
							multi_step: {
								hash:       "UNA7MH6ETJ9Q8AB34MJHD405PITHIK8QCTH08Q3GB1KSM6HS1KDG===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
