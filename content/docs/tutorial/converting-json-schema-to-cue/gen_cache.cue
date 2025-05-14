package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ckpitmINY9f0XD5CzkY7KQgkDv57O/PFxmwsIs8WPqU="
								"schema.cue":         "Oa/Giq99jUrVZxGRgHS184RzMN7AnFYcC8LnjU5p+ac="
								"split_pea.yml":      "ek3lXCGU7mwUY8j7AXmb+1rnDUSXyk3agTn3BemVVGs="
								"pomodoro.yml":       "zNMLo2YIHxIMl69IGMZhkpu7qkDPwultetK9avYx5L0="
								"pomodoro.yml fixed": "FOraLLGNRfm6LsmdLzD5ls6YEERMnYqg7WCb7EIFKhM="
							}
							multi_step: {
								hash:       "FDH2C2PK7D5FII354CA1FIC2VSR58B60BMM2FKCQJJHNFJCPI7O0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
