[monitoring]
%{ for ind in monitor_index ~}
${monitor_name[ind]} ansible_host=${monitor_ipaddr[ind]} ansible_user=${monitor_user}
%{ endfor ~}
[app-servers]
${app_name} ansible_host=${app_ippadr} ansible_user=${app_user}
