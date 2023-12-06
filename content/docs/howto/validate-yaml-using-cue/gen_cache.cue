package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "o6+Cxn/xZ0iA7gvKZdMXthH3XzEG9CH4eHDsgfZuZ7U="
								"initial x.cue":  "xy21OG90ZIuZ1fihiYc5DhkfOyQCI/I+7kjNA6hgEjU="
								"another person": "fUbd9nSKTZTq4xEyALK/tE3RNy1B5ZZk4+jrVNGSTHU="
								"fixed yaml":     "vXuXXYB7zSe1le45xuQj0n53/Bmh7WignZ0ABBoceGQ="
							}
							multi_step: {
								"9JFEDG0V5CLT7TVFJ4LASV2MUFMH7NPMPJTQH6F6T36HIVUEK520====": '''
										$ cat <<EOD > x.cue
										#Person: {
										\tname:    string
										\tage:     int
										\taddress: string
										}

										people: [X=string]: #Person & {
										\tname: X
										}

										EOD
										$ cue vet x.cue x.yaml
										daa46c69f182300392d3e025b5379272aea3ef34b0bcbd436133c12029b066fe
										daa46c69f182300392d3e025b5379272aea3ef34b0bcbd436133c12029b066fe
										0
										$ cat <<EOD > x.yaml
										people:
										  Gopher:
										    name: Gopher
										    age: 12
										    address: Mountain View
										  Ken:
										    name: Ken
										    age: 21
										    address: The Blue Sky
										  Rob:
										    name: Rob
										    age: 42.2
										    address: CUEtopia

										EOD
										$ cue vet x.cue x.yaml
										f0ead12d19524728472ea54c1f32b099608ef25ef5166dd605bca4cec773a743
										people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
										    ./x.cue:3:11
										    ./x.cue:7:21
										    ./x.yaml:12:10
										f0ead12d19524728472ea54c1f32b099608ef25ef5166dd605bca4cec773a743
										1
										$ cat <<EOD > x.yaml
										people:
										  Gopher:
										    name: Gopher
										    age: 12
										    address: Mountain View
										  Ken:
										    name: Ken
										    age: 21
										    address: The Blue Sky
										  Rob:
										    name: Rob
										    age: 42
										    address: CUEtopia

										EOD
										$ cue vet x.cue x.yaml
										1b18d540f5896d217ed9e815b5c351e08fa665c5062f0b6935b1657b03b7ccbd
										1b18d540f5896d217ed9e815b5c351e08fa665c5062f0b6935b1657b03b7ccbd
										0


										'''
							}
						}
					}
				}
			}
		}
	}
}
