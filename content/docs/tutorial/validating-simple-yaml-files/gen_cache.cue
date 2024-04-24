package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "u8foHN4LTOJDKOgQo5o7D5vw1WxUwzGjchxC2U/GPHs="
								"pets.cue": "Lpq3oxpGxUhnT5DhnN9Dt1V/ztsZ2shpg9Gf1KCg3vs="
								yamlFixed:  "5T11BJyPTkQfvVek7rNRQwwfUXrWKtDhBVofATRYt0c="
								yaml2:      "ZmJXih6Sjg4sI26JmPTNRYN7wZYAL10pH7jYWD/TlnA="
							}
							multi_step: {
								hash:       "5C2DBP62L4K7ATI260991NJLJN8KOK3S8U7M4KT71V1IONB79LF0===="
								scriptHash: "1MOMUPEMJIUF8IJSK8ID9EBD3O8DR5RGTBTUH1TTS75JA25QOC00===="
								steps: [{
									doc:      ""
									cmd:      "pwd # we start in our home directory, but you do not need to"
									exitCode: 0
									output: """
											/home/runner

											"""
								}, {
									doc:      ""
									cmd:      "mkdir validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet pets.cue charlie.yml"
									exitCode: 1
									output: """
											age: conflicting values "15" and number (mismatched types string and number):
											    ./charlie.yml:5:6
											    ./pets.cue:2:11
											species: 2 errors in empty disjunction:
											species: conflicting values "cat" and "goldfish":
											    ./charlie.yml:4:10
											    ./pets.cue:1:11
											species: conflicting values "dog" and "goldfish":
											    ./charlie.yml:4:10
											    ./pets.cue:1:19

											"""
								}, {
									doc:      ""
									cmd:      "cue vet pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet pets.cue charlie.yml toby.yml"
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
