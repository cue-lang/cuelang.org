package preprocessor

#site: {
	#sanitiser: #commandSanitiser & {
		kind!: string // the discriminator field
	}

	// Instances of #commandSanitiser define replacements
	// that should be applied to commands that match.
	#commandSanitiser: {
		kind: "commandSanitiser"

		// Implement a oneOf
		close({
			command?: [...string]
		}) | close({
			commandPrefix?: [...string]
		})
	}

	#page: {
		sanitisers?: [...#sanitiser]
		cache?: {
			upload?: [string]:     string
			code?: [string]:       string
			multi_step?: [string]: bytes
		}
	}

	content?: _siteContent

	_siteContent: {
		[!="page"]: _siteContent
		page:       #page

		// Because this would otherwise be closed by #site
		...
	}

	// Just allow other fields for now. Things will break at a later date if we
	// bring other fields into the scope of #site that conflict with existing
	// usage, but that's fine for now.
	...
}
