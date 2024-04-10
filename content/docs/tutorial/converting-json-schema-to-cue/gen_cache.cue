package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "xwi3J8AR8xt0hq/mxLwZuCuB9oSnlV3D0BfMaHX+2NY="
								"schema.cue":         "P/n+pHIJNifW4BHoEVQ44r0i5q7rNEXwsCHHeXn9tRA="
								"split_pea.yml":      "OPYpRsuHFcuEcKH7CAJQEioUAAwwrFkQmojzpUAq8vc="
								"pomodoro.yml":       "74Wekv3hErIF1Pf/ESONuFAAe7OHUBSUCmAwaJIH8Sw="
								"pomodoro.yml fixed": "d4PO2pbEymG3k3jS3wPrjEZHkOV/cmfRM75cTNiNRUA="
							}
							multi_step: {
								"IQG4CNV4GUQ12DG82SFBAFJGV475STFLJVUNNI08O9359KICJ07G====": [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
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
											    ./schema.cue:10:16
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
