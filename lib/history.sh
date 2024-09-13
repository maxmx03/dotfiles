#!/bin/bash
rm -f $HOME/.bash_history-*.tmp
history -c && history -w
