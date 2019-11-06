# Distributed Ruby

Did you know that Ruby has a built-in library that allows you to share Ruby code remotely via a **Remove Procedure Calls (RPC)**? The library is called `drb` and this is a simple example of how it can be used.

_Note: This is just a naïve example and it's not how it should be used in production. Since these calls happen over the network, if you plan to write code this way, you need to consider idempotency and account for possible network failure._

_To learn more about RPC, head to: https://en.wikipedia.org/wiki/Remote_procedure_call_

## Example in action

![example video](https://nmarcora.s3.eu-west-2.amazonaws.com/Kapture+2019-11-06+at+9.21.29.gif)

## How to run the example

- (Optional) Head over to `config.rb` and change `localhost` to your network IP if you wish to try it on different machines in the same network.
- Run `ruby Queue.rb` on one terminal.
- Run `ruby QueueListener.rb` on another terminal.
- Run `ruby QueueProducer.rb` on another terminal.

Type stuff into the terminal that's running `QueueProducer` and you will see it pop up in the one that's running `QueueListener`.

## How this example works

In [`Queue.rb`](./Queue.rb) a Queue is shared over RPC. This is an array-like object that is thread-safe.
>More info on Queues can be found [here](https://ruby-doc.org/core-2.5.0/Queue.html).

[`QueueListener.rb`](./QueueListener.rb) gets that queue object and stars an infinite loop that looks at the queue, pops its last item and puts in in the terminal.

[`QueueProducer.rb`](./QueueProducer.rb) also gets the remote queue and starts an infinite loop, but this loop constantly asks the user for input and pushes that to the queue.

What you get is 3 different files that do different things and can run on different machines and still talk to each other.

> i.e. you can have a queue shared on **machine A**, a listener for it on **machine B**, and a producer of values on **machine C**, and the code will still work. Whenever **C** inputs a value, **B** will see it and print it.
