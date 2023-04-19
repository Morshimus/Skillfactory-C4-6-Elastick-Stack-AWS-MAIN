[monitoring]
%{ for ind in monitor_index ~}
${monitor_name[ind]} ansible_host=${monitor_ipaddr[ind]} ansible_user=${monitor_user}
%{ endfor ~}
[Jenkins-CI]
${app_name} ansible_host=${app_ippadr} ansible_user=${app_user}
[Jenkins-CI:vars]
Jenkins_Docker_root=/opt/morsh_ci
pg_data_root=/opt/pg_data