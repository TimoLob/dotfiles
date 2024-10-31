# Tmux Cheat Sheet

Prefix = Ctrl+Space
Note to self : Use capslock for Ctrl


## Windows
New Window : `<prefix> c`  
Jump to window : `<prefix> [0-9]`  
Next window : `<prefix> n`  
Previous window : `<prefix> p`  
Kill window : `<prefix> &`  


## Panes
Horizontal split : `<prefix> %`  
Vertical split : `<prefix> "`  
Navigate panes : `<prefix> [Left/down/up/right arrow]`  
Navigate panes : `<prefix> [hjkl]`  
Close pane : '<prefix> x`  

## Sessions
New Session : Run `tmux` outside of tmux  
New Session : `<prefix> :new`  
New named session : `tmux -s <name>`  
List active sessions : `tmux ls`  
List active sessions : `<prefix> s`  
Switch to session : `<prefix> w`  
Attach to most recent session : `tmux attach`  
Attach to session by name : `tmux attach -t <name>`  




## References
https://tmuxcheatsheet.com/
