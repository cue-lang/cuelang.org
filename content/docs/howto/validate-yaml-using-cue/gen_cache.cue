package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "RQ2/rbzaG3pYDy7c7ZyKB4PBg2IWcdI5GGVU8k1hZ8c="
								"initial x.cue":  "atvsjd4K7BjIKuftUNzRtgdnZZtju+EOSKFK0EVu7s8="
								"another person": "OmfzHBnqT27ZyGdeEM/xD6M44ljVGiDPznrKPAKGRmg="
								"fixed yaml":     "LIv83NrO/x9sxZqRYztWbmjDLvOqgzZAkdtG/iVk750="
							}
							multi_step: {
								hash:       "LDCHIB0M4RKMUFKBPBKN47RS34NDLF42TSJBQ628TSSH6T84BE9G===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
