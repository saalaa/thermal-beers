# Thermal beers

Print beer tickets when Gitlab tests break. The person with the most tickets
treats the rest of the team.


## Architecture

    +----------+                  +---------------+
    |  Gitlab  |----------------> | web-server.js |
    +----------+  Webhook         +---------------+
                                    ^
          +------------+            |
          | printer.js |------------+
          +------------+  ZeroMQ
            |              ________________
            |            _/_______________/|
            |           /___________/___//||
            |          |===        |----| ||
            |          |           |   ô| ||
            |          |___________|   ô| ||
            |          | ||/.´---.||    | ||
            +----------|-||/_____\||-.  | |´
              CUPS     |_||=L==H==||_|__|/

In our specific case, our Gitlab installation could not communicate directly
with the machine that runs the printer. We therefore use a ZeroMQ socket to
forward print jobs to a machine that *is* connected to the printer.

## Usage

Part of the procedure common to both machines:

    $ git clone ...
    $ $EDITOR settings.js
    $ npm install

Then on the machine that Gitlab can talk to:

    $ node web-server.js

Then on the machine that can talk to the printer:

    $ node printer.js

Finally, a *Pipeline events* Webhook must be configured in Gitlab.


## Printer configuration

Nothing worked until we found https://github.com/rafael-freitas/zj-58.


# Acknowledgment

- `zj-58.js` has been borrowed from
  https://github.com/rafael-freitas/node-thermal-printer.
- The ascii beer has been found on
  http://www.chris.com/ascii/index.php?art=food%20and%20drink/beer and was
  credited to Hilko Bengen.
- The ascii printer has been found on http://ascii.co.uk/art/printer and was
  credited to Jan Foerster
