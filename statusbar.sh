time=$(date +'%Y-%m-%d %I:%M:%S %p')
bat=$(cat /sys/class/power_supply/axp288_fuel_gauge/capacity);
charge_status=$(cat /sys/class/power_supply/axp288_fuel_gauge/status);

if [ $charge_status = 'Charging' ]; then
  symbol=⚡
elif [ $bat -lt 20 ]; then
  symbol=⚠
else
  symbol=🔋
fi

echo "$time | $bat% $symbol"
