#! /bin/bash
docker() {
    #shellcheck disable=SC2140
    #shellcheck disable=SC1083
    #shellcheck disable=SC1012
    docker_ps_table="{{ "{{.Names}}\t" }}"\
"{{ "{{.State}}\t" }}"\
"{{ "{{.RunningFor}}\t" }}"\
"{{ "{{.Status}}\t" }}"\
"{{ "{{.Size}}\t" }}"\
"{{ "{{.Ports}}" }}"

    if [[ $* == "ps" ]]; then
        command docker ps --format "table ${docker_ps_table}" | more
    else
        command docker "$@"
    fi
}
