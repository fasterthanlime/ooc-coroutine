import coroutine/Coro

firstCoro, secondCoro : Coro

secondTask: func (context: Pointer) {
	
	num := 0
	
	printf("secondTask created with value %d\n", (context as Int*) @)
	
	while (true) {
		printf("secondTask: %d %d\n", secondCoro bytesLeftOnStack(), num += 1)
		secondCoro switchTo(firstCoro)
	}
	
}

firstTask: func (context: Pointer) {
	
	value := 2
	num := 0
	
	printf("firstTask created with value %d\n", (context as Int*) @)
	secondCoro = Coro new()
	firstCoro startCoro(secondCoro, value&, secondTask)
	
	while (true) {
		printf("firstTask: %d %d\n", firstCoro bytesLeftOnStack(), num += 1)
		firstCoro switchTo(secondCoro)
	}
	
}

main: func {
	
	mainCoro := Coro new()
	value := 1
	
	mainCoro initializeMainCoro()
	
	firstCoro = Coro new()
	mainCoro startCoro(firstCoro, value&, firstTask)
	
}
