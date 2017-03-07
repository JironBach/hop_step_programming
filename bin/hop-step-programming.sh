#!/bin/sh

app_home="/Users/js/work/hop_step_programming/"
. "${app_home}venv/bin/activate"
wsgi_ini="${app_home}etc/wsgi.ini"
wsgi_pid="${app_home}var/hop-step-programming.pid"
wsgi_log="${app_home}var/hop-step-programming.log"

start(){
    echo "uWSGI hop-step-programming start"
    uwsgi --ini $wsgi_ini --daemonize $wsgi_log --pidfile $wsgi_pid --chmod-socket=666
}

stop(){
    echo "uWSGI hop-step-programming stop"
    kill -QUIT `cat $wsgi_pid`
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
esac

