municipality: {
	name:    string
	pop:     int
	capital: bool
}

largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}

kinshasa: {
	name:    "Kinshasa"
	pop:     16.32M
	capital: true
}

largeCapital: municipality
kinshasa:     largeCapital
