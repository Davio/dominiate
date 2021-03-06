Dominiate
=========

Dominiate is a Dominion simulator, in which you can program bots to follow
strategies that you define and see which one wins.

It is inspired by Geronimoo's Dominion Simulator. It shares the feature that,
to define many possible strategies, you may simply list cards and conditions in
which to buy them in priority order.

The code is meant to be open and extensible. Many other aspects of a strategy
can be overridden, including its preferences for how to play actions. If this
system doesn't allow you to define the strategy you want and you're okay with
writing more code, I encourage you to fork the simulator and change it so that
it does.

Dominiate is written in CoffeeScript, which compiles to JavaScript. This means
it can either run at the command line using node.js, or it can run natively
in a Web browser!

Documentation
-------------
The `docs` directory contains documentation in the "literate programming" style
-- that is, it shows you the code in parallel with explanations of what it
does.

Installation
------------
To use the command-line version, you will need a reasonable development
environment with a command line.

First, acquire node.js (v0.4 or later) and npm (the Node Package Manager).  The
best way to do this differs by operating system and changes a lot.

Enable CoffeeScript by running `sudo npm-g install coffee-script` (or whatever
the equivalent is on Windows). Now node.js will understand CoffeeScript source
files.

Running "./play.coffee bot1 bot2" will load the bots with the
specified names and play them against each other. For example:

    ./play.coffee strategies/BigMoney.coffee strategies/ChapelWitch.coffee

Building the Web app
--------------------
The Web version of Dominiate is built using CoffeeScript and Less CSS. You'll
need to follow the instructions above to set up CoffeeScript. You should also
install Less CSS with `sudo npm-g install less`.

Then, type `make` to build the JavaScript and CSS files that will be used
on the Web.

Do not edit the computer-written JavaScript directly! That way lies madness.

Roadmap
-------
Short-term planned features include:

- Don't buy cards that make you instantly lose
- Implement almost all the cards

Longer term plans:

- Simulate the effects of playing cards (to a shallow depth) in order to
  choose an action.
- Calculate the game-theoretic implications of a buy, to implement the
  Penultimate Province Rule.
- Hook into Golem, in order to buy a card based on the situation

Things I never plan to implement without help:

- Tricks with multi-revealing Secret Chamber
- Outpost
- Possession

