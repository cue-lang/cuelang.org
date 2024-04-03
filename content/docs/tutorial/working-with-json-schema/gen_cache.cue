package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-json-schema": {
					page: {
						cache: {
							upload: {
								"json schema":     "awQYxQbBHDgf9jc9L+sedmBNBQEutNHX4rCa1kq7Mc4="
								"schema.cue":      "LqgCJ/Zf8j4S3vJPeeZd2pqOUtmJf/og+D3eSG1iji8="
								"data.yml":        "91ohhzxUTQOnOiNnow5iiyKng2MvIpF4WjBQkMvGAwQ="
								"constraints.cue": "vuD0yRTKy46UzvLAIcepiAOmV+pk+1oQ8ElwE3ioWSA="
								"data.yml fixed":  "8gMKOOpLmeW7afqjC7UwNp9OmWl+BykJ0EYEQdxDryQ="
							}
							multi_step: {
								"1JPTOBB5BAR71U5INGM9KJHUODM8NHVHRR5EAPDM8T080DKR9R40====": [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#Restaurant:' -p cuisine schema.json"
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
									cmd:      "cue vet . data.yml"
									exitCode: 1
									output: """
											restaurants."Il Pomodoro Marcio".tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:9:16
											    ./data.yml:11:16

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . data.yml"
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
