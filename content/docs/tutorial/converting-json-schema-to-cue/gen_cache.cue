package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "hpLOohhNKhBWae37G6SunTWs4q8AslCd9nQrvO+IbXw="
								"schema.cue":         "hMkhrk5ny6SrNvY3j26mRFNn9FZefgvcdh9Z7/7iIFE="
								"split_pea.yml":      "su1OPOCSPc6I+PtKpZHhxz8xLkW/FqqfjctPi51LPv4="
								"pomodoro.yml":       "OSj9ILGynhc9eXqurpVMIgSgo0XySX45wXaEJ26+Auo="
								"pomodoro.yml fixed": "6fC6PLHBLmC8DQTAS6ecuF7w8FP/XKW7vwZcqU9TLmA="
							}
							multi_step: {
								hash:       "22KOA338HBGD5C7DA85PU09G0OB1G6ULCVPT8M2QMBIR754A1O80===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
											    ./schema.cue:13:17
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
