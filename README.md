## What I want to do?

See if doubles can be used inside RSpec's shared examples.

## Why I want to do it?
 
Shared examples are something I've not explored much, and this
question was asked in #rubyonrails on irc.freenode.net.

## What it means if I could do it?
 
I'd probably use shared examples more, which would save on writing
code for tests.

## What stops me from doing it?

I haven't thought about it before.

## What it means that I can't do it

Nothing much different than what I'm doing now

## What I've tried, and what happened

The test code is shown in `spec/shared_examples_spec.rb`.

### First attempt

The first attempt, tagged 'v1', used `let()` and `let!()` to attempt
to create local variables that were set to doubles.

In addition, these variables were passed to the included examples as
block parameters, which is also incorrect.

### Second attempt

The second attempt, tagged 'v2', gets it right.

After reading through the RSpec book section on shared examples, it
became clear the thing to do is create instance variables in a
`before` block, and call them in the shared examples.

### Third try

Thinking about this more, I gave the `let()` variables another go, but
instead of attempting to pass them in, just like the instance
variables in the second attempt, they should be available in the `it`
blocks in the shared example set, and lo - they are!

