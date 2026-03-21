#!/bin/bash

case "$1" in
    start)
	minikube start --extra-config="apiserver.cors-allowed-origins=['http://boot.dev']"
	minikube dashboard --port=63840 &
        ;;
    stop)
        echo "Stopping minikube"
	minikube stop
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
esac
