package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "JMG7o8DlbevTShCWDw8JXR7FjrzWEN6fuxeqOa4rD24="
								"schema.cue":         "9xJFRjTfG7L7K1/+7akdnh+9M1kQJ0pVaJWWAqwudCU="
								"split_pea.yml":      "CSJv9akmp9FmlJ4Tc506nGv+Dpo3PxJNQShw40d5AHE="
								"pomodoro.yml":       "XrP/TfsCCD/YCnDFB+T8b4Kz5V6ZXopT/YHNbms9n8Q="
								"pomodoro.yml fixed": "BUl9INL7krAbFdiPUtEfuiqQ9YuEMQ0LQm7zQGfNgiY="
							}
							multi_step: {
								hash:       "SU53UQ2J4SNTRKBCH7BP759CVVNMC1QCDGDFKQPMKJGHSBNLU6MG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-0.dev.0.20250822143201-1eff22f3f91f
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
