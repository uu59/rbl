install from pipe

  $ . $TESTDIR/helper.sh
  $ (cat $TESTDIR/../rbl | sh > /dev/null 2>&1 || exit 0)
  $ test -x $HOME/.rbl/current/bin/rbl

rbl install

  $ . $TESTDIR/helper.sh
  $ rbl install 2>/dev/null
  $ test -x $RBL_DIR/current/bin/rbl
  $ tree $RBL_DIR
  /* (glob)
  |-- core
  |   `-- bin
  |       `-- rbl -> */rbl (glob)
  |-- current -> */core (glob)
  `-- rbl
  
  * directories, * files (glob)

rbl install with $RBL_DIR fixed:

  $ . $TESTDIR/helper.sh
  $ export RBL_DIR=$TESTDIR/tmp2
  $ rm -rf $RBL_DIR
  $ echo $RBL_DIR
  */tmp2 (glob)
  $ rbl install 2>/dev/null
  $ tree $RBL_DIR
  /* (glob)
  |-- core
  |   `-- bin
  |       `-- rbl -> */rbl (glob)
  |-- current -> */core (glob)
  `-- rbl
  
  * directories, * files (glob)
  $ rm -rf $TESTDIR/tmp3
  $ RBL_DIR=$TESTDIR/tmp3 rbl install 2>/dev/null
  $ tree $TESTDIR/tmp3
  /* (glob)
  |-- core
  |   `-- bin
  |       `-- rbl -> */rbl (glob)
  |-- current -> */core (glob)
  `-- rbl
  
  * directories, * files (glob)
