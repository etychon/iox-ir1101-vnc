# iox-ir1101-vnc
Cisco IOx application that hosts a small Alpine Linux with VNC server to use as a Jump Host

THIS IS A WORK IN PROGRESS

IOx app will listen to TCP/5900 for incoming VNC connections. Make sure to
map the IOx app IP and port (in this case 192.168.1.3 is the IOx app IP
address) to the outside port:
 
ip nat inside source static tcp 192.168.1.3 5900 interface GigabitEthernet0/0/0 10000

To run firefox, open a terminal (xterm) and type "firefox" at the prompt.
IOx app will need at least 512 MB of RAM allocated if you want to run
Firefox.
 