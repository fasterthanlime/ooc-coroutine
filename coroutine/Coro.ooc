use coroutine

Coro: cover from Coro* {
	
	new: static extern(Coro_new) func -> This
	bytesLeftOnStack: extern(Coro_bytesLeftOnStack) func -> Int
	switchTo: extern(Coro_switchTo_) func (This)
	startCoro: extern(Coro_startCoro_) func (This, Pointer, Func)
	initializeMainCoro: extern(Coro_initializeMainCoro) func
	
}
