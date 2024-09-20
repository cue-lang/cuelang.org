package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "xS7bWAQ/zixnqtDf8qYx+25MPekwJrTHimZgFJxJmwc="
								"schema.cue":         "i/YvBeJtWI6DLsQEwBYKKCVWwo30pBBnMt9bIxNER+E="
								"split_pea.yml":      "StK7kncakjx7YHiVxW9wUXV1GPyrISTbWUcbl5iaYM8="
								"pomodoro.yml":       "h/W+wUHZ//QSla8hhjUztzZDuJlGosU7ImmNdkSRftI="
								"pomodoro.yml fixed": "AJ4VNjjN47AyNYIWECf1UN5YQERiAvF7g8jVZ7LhIZs="
							}
							multi_step: {
								hash:       "EDDKF0IKS021FBIST1H5V3P6BRABENJVF195MFBR4B3IAEN9BENG===="
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
