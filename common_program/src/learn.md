'let' is a keyword used to declare a new variable in the program.   

We can use `let x = x + 1`  to shadow this literal. It means that we can continue using this literal without declaring new variable.
The other difference between mut and shadowing is that because we’re effectively creating a new variable when we use the let keyword again, 
we can change the type of the value but reuse the same name. 