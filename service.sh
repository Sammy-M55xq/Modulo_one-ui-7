#!/system/bin/sh
MODDIR="${0%/*}"

sleep 60

echo '100' > /dev/memcg/memory.swappiness
echo '40' > /dev/memcg/system/memory.swappiness
echo '50' > /dev/memcg/apps/memory.swappiness

# Clear memg system
for clear in $(cat /dev/memcg/system/cgroup.procs); do
    echo $clear > /dev/memcg/cgroup.procs
done

# Executa o processo PID
process_name="system_server"
pid_proc=$(pidof "$process_name")
echo $pid_proc > /dev/memcg/system/cgroup.procs

process_name="surfaceflinger"
pid_proc=$(pidof "$process_name")
echo $pid_proc > /dev/memcg/system/cgroup.procs

# Reduz a carga do Composer do Android
process_name="android.hardware.graphics.composer@2.0-service"
pid_proc=$(pidof "$process_name")
echo $pid_proc > /dev/memcg/system/cgroup.procs

process_name="android.hardware.graphics.composer@2.1-service"
pid_proc=$(pidof "$process_name")
echo $pid_proc > /dev/memcg/system/cgroup.procs


process_name="android.hardware.graphics.composer@2.2-service"
pid_proc=$(pidof "$process_name")
echo $pid_proc > /dev/memcg/system/cgroup.procs


process_name="android.hardware.graphics.composer@2.3-service"
pid_proc=$(pidof "$process_name")
echo $pid_proc > /dev/memcg/system/cgroup.procs

process_name="android.hardware.graphics.composer@2.4-service"
pid_proc=$(pidof "$process_name")
echo $pid_proc > /dev/memcg/system/cgroup.procs

process_name="vendor.qti.hardware.display.composer-service"
pid_proc=$(pidof "$process_name")
echo $pid_proc > /dev/memcg/system/cgroup.procs

exit 0