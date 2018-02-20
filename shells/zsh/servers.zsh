# crouton clipboard server, require node to be installed

if [ -e ~/.crouton-clipboard/data.txt ]
then
    (nohup node ~/.crouton-clipboard/server.js > /dev/null 2>&1 &)
fi

