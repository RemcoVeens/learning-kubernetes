#!/bin/bash

case "$1" in
    start)
	minikube start --extra-config="apiserver.cors-allowed-origins=['http://boot.dev']"
	minikube dashboard --port=63840 &
	kubectl proxy &
	minikube tunnel --bind-address="127.0.0.1" -c &
        ;;
    stop)
        echo "Stopping minikube"
	minikube stop
	sudo pkill -f "minikube tunnel"
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
esac
