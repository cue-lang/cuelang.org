package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "+xUpsxOQFobMvhHzZEjpJpDJ3xpitecsG77PwryRQg0="
								"schema.cue":         "0bBF6yRhhMbZw9/T4a5CS++thjLGgPTP8V4DNhILiaM="
								"split_pea.yml":      "t/FF0yaoQa8IwPHts//Heu4l17auI/qTtsildrPFd/w="
								"pomodoro.yml":       "qgMO65Qs83LKub1IEKMmSa5X3zmCWrbMwRlVAPBE+M4="
								"pomodoro.yml fixed": "BeIEjeQd0dipNBQ9Hrbz7c0tbkWOX7XSY1Oy7Mzzms8="
							}
							multi_step: {
								hash:       "5JA24CCCB8Q647AMB8VNT8KUFDIPBV6TV3SRF4D4NF2PN732LCLG===="
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
