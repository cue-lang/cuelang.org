package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "5dr6geA0SlLLlUUgO8dYBaaTiJm8q14SqtuG6+tSeb4="
								"initial x.cue":  "8ps0ipi1+drtBSzRa7WvRi+XvxcXaxhPKBpG1WFck3c="
								"another person": "iQB+yArCCJsjwh/6rgkCRbQSJlP/zLlVADy/1QsG7I0="
								"fixed yaml":     "2TRjXzLjam3w3Awstypzs97CQywGyttvl7wAlDKKIow="
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
										    ./x.yaml:12:11
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
