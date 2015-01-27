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

#### Results

    testing doubles for use in shared examples
      first try
        when contact has a phone number
          returns the phone number
        when a collection is empty
          has no members
      second try (these should fail)
        when contact has a phone number
          returns the phone number (FAILED - 1)
        when a collection is empty
          has no members (FAILED - 2)
    
    Failures:
    
      1) testing doubles for use in shared examples second try (these should fail) when contact has a phone number returns the phone number
         Failure/Error: expect(@contact.phone).not_to be_nil
           expected: not nil
                got: nil
         # ./spec/shared_examples_spec.rb:9:in `block (4 levels) in <top (required)>'
    
      2) testing doubles for use in shared examples second try (these should fail) when a collection is empty has no members
         Failure/Error: expect(@collection.size).to eq(0)
           
           expected: 0
                got: 12
           
           (compared using ==)
         # ./spec/shared_examples_spec.rb:15:in `block (4 levels) in <top (required)>'
    
    Finished in 0.0034 seconds (files took 0.10131 seconds to load)
    4 examples, 2 failures
    
    Failed examples:
    
    rspec ./spec/shared_examples_spec.rb:8 # testing doubles for use in shared examples second try (these should fail) when contact has a phone number returns the phone number
    rspec ./spec/shared_examples_spec.rb:14 # testing doubles for use in shared examples second try (these should fail) when a collection is empty has no members
    
