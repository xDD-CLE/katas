# Langton's Ant

This is a Clojure implementation of [Langton's Ant](https://en.wikipedia.org/wiki/Langton's_ant).

## How to run the program

You may specify rules for up to 9 colors using "R" to indicate a right turn and "L" to indicate a left turn.

You can run the first 100 steps with Langton's original rules like this:

`lein run -- RL --steps 100`

Which will produce output like this:

![Example output](https://www.dropbox.com/s/8pn6oyepn6rra34/langton-term.gif?raw=1&dl=0&size=1280x960&size_mode=3)

Additionally, you can adjust the speed of the simulation by providing the amount of time to pause between each step (in milliseconds).

### Full usage

`lein run -- <rules> --steps <steps> [--interval <msec>]`

## How to run the tests

The project uses [Midje](https://github.com/marick/Midje/).

`lein midje` will run all tests.
