package cmd

// tabProps captures the inputs required to a code-tabs hugo output
type tabProps struct {
	Name     string
	Language string
	Type     string
}

type codeTabLocation string

const (
	//lint:ignore U1000 we will use this later, documenting for completeness' sake now
	codeTabTop codeTabLocation = "top"

	//lint:ignore U1000 we will use this later, documenting for completeness' sake now
	codeTabBottom codeTabLocation = "bottom"

	//lint:ignore U1000 we will use this later, documenting for completeness' sake now
	codeTabLeft codeTabLocation = "left"

	//lint:ignore U1000 we will use this later, documenting for completeness' sake now
	codeTabRight codeTabLocation = "right"

	codeTabTopLeft     codeTabLocation = "top-left"
	codeTabTopRight    codeTabLocation = "top-right"
	codeTabBottomLeft  codeTabLocation = "bottom-left"
	codeTabBottomright codeTabLocation = "bottom-right"
)
