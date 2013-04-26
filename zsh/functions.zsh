function railstags() {
  rtags --vi -a -f tags -R app -R lib -R script -R spec
}

function vack() {
  ack -l $* | xargs mvim -p
}

function reload! {
  echo Restarting Passenger...
  touch tmp/restart.txt
}

function internet\? {
  (ping -c 3 -t 3 google.com >/dev/null 2>&1 && echo 'yep') || echo 'nope'
}

