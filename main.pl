start :-
    nl,
    write('Calculator'), nl,
    write('Choose operation:'), nl,
    write('1) Add'), nl,
    write('2) Subtract'), nl,
    write('3) Multiply'), nl,
    write('4) Divide'), nl,
    write('5) Exit'), nl,
    read(Operation),
    (   member(Operation, [1,2,3,4,5])
    ->  process(Operation)
    ;   write('Wrong number, please try again.'), nl
    ),
    start.
    

process(Operation) :-
    ( Operation == 5
        -> halt(0)
        ; true
    ),
    write('Enter first number: '),
    read(First),
    ( number(First)
        -> true
        ; write('You must privide a number'), nl, process(Operation)
    ),
    write('Enter second number: '),
    read(Second),
    ( number(Second)
        -> true
        ; write('You must privide a number'), nl, process(Operation)
    ),
    ( Operation == 4, Second == 0 
        -> write('Cannot divide by 0'), nl, write('Please try again'), nl, process(Operation)
        ; true
    ),
    do_operation(Operation, First, Second).


do_operation(1, First, Second) :- Result is First + Second, format('~6f + ~6f = ~6f', [First, Second, Result]), nl.
do_operation(2, First, Second) :- Result is First - Second, format('~6f - ~6f = ~6f', [First, Second, Result]), nl.
do_operation(3, First, Second) :- Result is First * Second, format('~6f * ~6f = ~6f', [First, Second, Result]), nl.
do_operation(4, First, Second) :- Result is First / Second, format('~6f / ~6f = ~6f', [First, Second, Result]), nl.
do_operation(5, First, Second) :- halt(0).