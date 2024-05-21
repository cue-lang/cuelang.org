package site
{
	content: {
		docs: {
			introduction: {
				"why-cue": {
					page: {
						cache: {
							upload: {
								schema:       "azTycwdxBALG9dw3WwNIRjhWAd/ldnnWAsmA92BannE="
								data:         "QIvcejCsMDlS+fhzDQm+xd9wcx2k3NMm67b8atOEzXI="
								"defaults 1": "3KZuKKBauyrWx7yL7gTzSodYKTFP1qFvmsGFRMMlFv4="
								"defaults 2": "PccVXDTBXZClDiJ1eeEZw2BPcH5/pOqW9r0GmsCoFok="
							}
							code: {
								"unified syntax":         "/tNu0ps4Vd5WcbBKr+Y0yLt1utlngZykrrgO0YqbI4E="
								"constraints are values": "CG40aOs97Evky/K8hIZ/CG8g9EVSNAnaJx/IHfK8ZfI="
								data:                     "CG7SCjPrssmv4QobsLcXjPN/zzgAD1CHvOl02cUeu30="
								schema:                   "gp3JIPRSJCZvHTf8RoxPLIU9LJqxpuCt5WJ/RTI4TV0="
								CUE:                      "EXkHX+IlscJw9cjmMwWxBKuI2i0755/UxU4JC6MQ8jc="
								json:                     "IMR8dtKzlPoyIZajszw+rPKIbrNVH2se9JWTLz22Cck="
								"cue form of json":       "kUivrYQoasDGujFg2ZtB25kEgo3oXlzM89rtwe8yImg="
								"non-dry":                "kIwpLkBvEcnwoZYK9jeGeS58XXeOvgLQcj4KFUfjvbc="
								dry:                      "+DZ73AcAqArO4OvlD3rhoE2tO0VP6IfAULDi1sVdpU0="
							}
							multi_step: {
								hash:       "6MAE97QKSA5TA68ROT4G3HDNCD4M7ES2GK70TFSHTM1L5L3M8Q10===="
								scriptHash: "VBUBUHU2HF7JINLASR0J0LQT5B8BVDFAB0R6BD6PVSBSD9ORQ590===="
								steps: [{
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat site.cue"
									exitCode: 0
									output: """
											package website

											// pages is a struct whose fields each adhere to the
											// #Page constraint imposed through a pattern constraint.
											pages: [_]: #Page
											pages: {
											\thome: {
											\t\ttitle:   "Welcome to Widgets'R'We!"
											\t\turlPath: "/"
											\t\tfile:    "pages/home.html"
											\t\tsummary: "The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East."
											\t}
											\tabout: {
											\t\ttitle:   "About Widgets'R'We"
											\t\turlPath: "/about/"
											\t\tfile:    "pages/about.html"
											\t\tsummary: "Information about the Widgets'R'We company."
											\t}
											\tcontact: {
											\t\ttitle:   "Contact Widgets'R'We"
											\t\turlPath: "/contact/"
											\t\tfile:    "pages/contact.html"
											\t\tsummary: "Contact information for the Widgets'R'We company."
											\t\tauthor:  "Markus Marketing"
											\t}
											}

											"""
								}, {
									doc:      "#ellipsis 12"
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											pages:
											  home:
											    title: Welcome to Widgets'R'We!
											    urlPath: /
											    file: pages/home.html
											    date: "1999-01-01T00:00:00Z"
											    summary: The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East.
											    author: null
											    isDraft: false
											  about:
											    title: About Widgets'R'We
											    urlPath: /about/
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat site.cue"
									exitCode: 0
									output: """
											package website

											// pages is a struct whose fields each adhere to the
											// #Page constraint imposed through a pattern constraint.
											pages: [_]: #Page
											pages: {
											\thome: {
											\t\ttitle:   "Welcome to Widgets'R'We!"
											\t\turlPath: "/"
											\t\tsummary: "The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East."
											\t}
											\tabout: {
											\t\ttitle:   "About Widgets'R'We"
											\t\tsummary: "Information about the Widgets'R'We company."
											\t}
											\tcontact: {
											\t\ttitle:   "Contact Widgets'R'We"
											\t\tsummary: "Contact information for the Widgets'R'We company."
											\t\tauthor:  "Markus Marketing"
											\t}
											}

											"""
								}, {
									doc:      "#ellipsis 12"
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											pages:
											  home:
											    title: Welcome to Widgets'R'We!
											    urlPath: /
											    summary: The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East.
											    file: pages/home.html
											    date: "1999-01-01T00:00:00Z"
											    author: null
											    isDraft: false
											  about:
											    title: About Widgets'R'We
											    urlPath: /about/
											...

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
