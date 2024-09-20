package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Fo//QmBIt8D8KGEKvLdmpYbQhRa81bnGzaRDTdZ3eC8="
								"schema.cue":         "T5/Gb+MsTWMeWQ7EJB9rJmTdMKWCQHD0+wsu/dOlgR4="
								"split_pea.yml":      "qgPoS6666Rf9J7DC+2wWEbc40QE30waoKBor6Iq6Yq0="
								"pomodoro.yml":       "mVN222oG+D2Hhi4eLTsDCXdUV2J+B3w8tPSFqin/5Vk="
								"pomodoro.yml fixed": "aDrVzV4vAoCq0wnNjL4D5NCQFUuLQunLN3xxBaFruQ4="
							}
							multi_step: {
								hash:       "IU5R7J74L1JT2TLD01G993F7BQVNMIDLI4ELELJQODPOGHUEUET0===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:10:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
