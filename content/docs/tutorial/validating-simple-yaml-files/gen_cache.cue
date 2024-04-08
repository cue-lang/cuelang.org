package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "MVGlHS0VdT3rmFPKBEpETPswCjcU5fdBTXQ+sBJwK9Q="
								"pets.cue": "yWmIu+HU2tJim5zJKx03SH1Jcg0obh2LK1suAD3To4M="
								yamlFixed:  "hYcJ+XHS3TiFsttb5ZYb5WAHy+3cR44HN4EMKgCdp1s="
								yaml2:      "4uB1YWUvT7XiUZKBZq0ZmtFYBqd2hTlcDz0ZqosRA9U="
							}
							multi_step: {
								"UL365KFPKVVK01M1QPD44FMMU3HDKOTJTCHIAO42F0E20HENGMBG====": [{
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
