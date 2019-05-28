#!/usr/bin/env bash

if [[ -f "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
  rvm use ${RVM_RUBY_VERSION_TP_INV}
  rvm gemset use ${RVM_GEMSET_NAME_TP_INV}
fi

function start_kafka {
			tmux new-window -t TpInv -n kafka "services/kafka.sh start"
			echo "Waiting for Kafka initialization 20 sec..."
			sleep 20
			echo "Done"
}

function stop_kafka {
    ./services/kafka.sh stop
    sleep 1
    tmux kill-window -t TpInv:kafka &> /dev/null
}

function start_svc_in_tmux {
    local svc=$1

    if [[ ${svc} == "kafka" ]]; then
        start_kafka
    else
        tmux new-window -t TpInv -n ${svc} "services/${svc}.sh"
    fi
}

function stop_svc_in_tmux {
    local svc=$1

    if [[ ${svc} == "kafka" ]]; then
        stop_kafka
    else
        tmux kill-window -t TpInv:${svc} &> /dev/null
    fi
}
