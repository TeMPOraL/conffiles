function wgt -d "wgets the URL from clipboard."
   wget $argv (xclip -o)
end
