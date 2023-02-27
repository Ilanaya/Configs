function xcp --wraps='xclip -selection clipboard' --descrtiption 'alias xcp=xclip -selection clipboard'
  xclip -selection clipboard $argv; 
end
