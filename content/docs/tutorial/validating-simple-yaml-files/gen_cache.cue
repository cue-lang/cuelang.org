package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "KDYODgkx/yP4BhDmnYmDLG8UDu95GzB+gZxAfCXGmwM="
								"pets.cue": "MP2LikxLs9IrheyT7Ph0rKOczr2+twlCkPt/r9EYl4E="
								yamlFixed:  "/SXeH74pWvWrtqex8HfcwOWY3YoKBHXeu+4cBCVMv6I="
								yaml2:      "aMLyV3Esa1jiDfb6rJlZ+OluzValczAlkEa9aoLScSw="
							}
							multi_step: {
								"3T0E5F5D4GL9PDLRH5NAFQIB5V5TUN3IFV369JVH666USD6J5C50====": [{
									cmd:      "pwd # we start in our home directory, but you do not need to"
									exitCode: 0
									output: """
											/home/runner

											"""
								}, {
									cmd:      "mkdir validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cd validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
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
									cmd:      "cue vet pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
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
