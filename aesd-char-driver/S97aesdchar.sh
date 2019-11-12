#!/bin/sh

# Get function from functions library
#. /etc/init.d/functions

aesdchar_load() 
{
    echo "Loading scull_load"
    
    module=aesdchar
    device=aesdchar
    mode="664"
    cd `dirname $0`
    set -e
    # Group: since distributions do it differently, look for wheel or use staff
    if grep -q '^staff:' /etc/group; then
        group="staff"
    else
        group="wheel"
    fi

    modprobe $module.ko $* || exit 1
    major=$(awk "\$2==\"$module\" {print \$1}" /proc/devices)
    rm -f /dev/${device}
    mknod /dev/${device} c $major 0
    chgrp $group /dev/${device}
    chmod $mode  /dev/${device}
}
    
aesdchar_unload() 
{
    echo "Unloading scull_load"
    
    module=aesdchar
    device=aesdchar
    cd `dirname $0`
    # invoke rmmod with all arguments we got
    rmmod $module || exit 1

    # Remove stale nodes

    rm -f /dev/${device}
}


# Start the S97aesdchar module

start() 
{
    aesdchar_load
}

# Start the S97aesdchar module

stop() 
{
    aesdchar_unload
}

### main logic ###

case "$1" in
  start)
        echo "MAIN: Starting S97aesdchar module"
        start
        ;;
  stop)
	echo "MAIN: Stoping S97aesdchar module"
        stop
        ;;
  *)
        echo $"Usage: $0 {start|stop}"
        exit 1
esac

exit 0
