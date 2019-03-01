# check some system items when using Live USB
# the alias to run this is $chk

echo "Memory usage is :" && df -h | grep sda2 | awk '{print $5}'
echo "--------------"
echo "CPU is currently used by :" &&  ps aux | awk '$3+$4> 5' | awk '{print $11 "  " $3+$4}'


