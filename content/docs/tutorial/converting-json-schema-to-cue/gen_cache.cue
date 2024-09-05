package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "WWOT5AhQY1XHA+LLw1XRotHifLVuHlKJe9zzg3eFPgg="
								"schema.cue":         "QLCAXyMD9qYCoWdn+SGKf1Qqp4Pw1uo282S3bs6SAw8="
								"split_pea.yml":      "ofapiZQQSca0PP1dwq7MLCpMKxa5j+RZ8VtpYB7nuR8="
								"pomodoro.yml":       "mqnuCznQACwJ+CH3ZCOZGSHUFHh/LJmM5LQOmhzV1mQ="
								"pomodoro.yml fixed": "f5RN40yhw1jPFRU83H+UnGhSl7ybbZtkeCve6JzCErU="
							}
							multi_step: {
								hash:       "391BIBN0BCQK0VF0INMP81KFQS472596NFBCFL7C3SIP18AG2PBG===="
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
