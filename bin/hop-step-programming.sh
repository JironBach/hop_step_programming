#!/bin/sh

virtualenv_dir="/Users/js/work/hop_step_programming/"
wsgi_ini="${virtualenv_dir}etc/wsgi.ini"
wsgi_pid="${virtualenv_dir}var/hop-step-programming.pid"
wsgi_log="${virtualenv_dir}var/hop-step-programming.log"

start(){
    echo "uWSGI hop-step-programming start"
    uwsgi --ini $wsgi_ini --daemonize $wsgi_log --pidfile $wsgi_pid
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

