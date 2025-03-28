package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "iXPrpq0KLM9XzCWdWvfIxDLk9XXbftMYNlKLm2w8E4c="
								"schema.cue":         "7/lPJsFQq8fbgR77l2iL3Q6vKgcngE3Xzl0MiyfQFSM="
								"split_pea.yml":      "y5ttMlT0vTi+ofFjG8MPOJnuKzgJ7Jx2tCS9l6gy9MY="
								"pomodoro.yml":       "QH4fbh5Tl5KK6dmz3udwnxdaecafUqW0L9Aeio4zMNQ="
								"pomodoro.yml fixed": "lLhO+BUnkU03XDw3NSMVofApBGU2xiDnah0kgr6BFEs="
							}
							multi_step: {
								hash:       "2DIU2N6PF4RRHL5SJS04DA4797B3J6SFH5CIBUVVMUL7MUCC3O8G===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-alpha.2.0.20250328144635-721ca5db06fc
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
