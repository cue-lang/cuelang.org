package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "aeAmlWuB85RBws8SGK3lhmr2Mlz0mzbOpIJ8EUvOBtg="
								"initial x.cue":  "eqCxRWQyBCV627dNQNhoPPuGQdSLvy5LbRbRYkfRMNc="
								"another person": "SGENE8rPxDajn3v7lkPf+RQR3xnDERYfo/PyZQBQr28="
								"fixed yaml":     "eOyIPyc19G3xE2wukkj7J+8ZU9213djHKK8XFekQdak="
							}
							multi_step: {
								"HO1IR3J5KC9EQKTRID4QGKC59S6U9L8OETPFIAT2ASROMHR2391G====": '''
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
