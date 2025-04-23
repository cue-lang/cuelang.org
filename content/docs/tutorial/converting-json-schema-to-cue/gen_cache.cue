package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "fUy91ZtqHFDZ0z7B+aIp/xgfrQiS2us4ylJSNekxiS0="
								"schema.cue":         "mL9kQCwbzasj594RKTSxkxwjpXXgb+fmFLfjREuqqyo="
								"split_pea.yml":      "4cBmEO+kWC6ei3dcDzQ0CsCx5Vf61E7/ym4JTK2qYvw="
								"pomodoro.yml":       "0ol/hwNFXZkeNpZBTWXKYy7kOxbw5Bxw02lHE/WgXnU="
								"pomodoro.yml fixed": "vjkyhdWpK9LBKNRg5LUiloEdp45gkNeKvVVT6Vvgt9M="
							}
							multi_step: {
								hash:       "JS3KRA5OK0NOVAHSA79DRNRVAR9L5UMUMGC3JMVPHFPVHE5F1RFG===="
								scriptHash: "S1P1N4BEQ13PVKLHR7S49GT6BCDNEBPHJ3GI7AJEV2HUL129L28G===="
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
