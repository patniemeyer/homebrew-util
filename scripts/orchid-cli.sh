#!/bin/bash
default_curator='partners.orch1d.eth'
orchid="##PREFIX##/orchid"

usage() {
  echo "Usage: orchid-cli"
  echo "    --help"
  echo "        Show usage"
  echo "    --config file, -c file"
  echo "        Run the VPN using the specified configuration."
  echo "    --account file, -a file"
  echo "        Run the VPN in a single hop configuration using the specified acount information."
  echo "    --whatsmyip, -i"
  echo "        Query the ip address using the default route."
  #echo "    --balance"
  #echo "        Query the account balance."
  #echo "        Warning: Balance queries use a public gateway and may reveal information about"
  #echo "        your account and ip address to a third party."
  exit;
}

show_ip() {
    dig +short myip.opendns.com @resolver1.opendns.com
    exit;
}

if [ $# -eq 0 ]; then usage; fi

while [[ $# -gt 0 ]]; do
  arg="$1"
  case $arg in
    --help)
      usage;
    ;;
    -i|--whatsmyip)
        show_ip;
    ;;
    -a|--account)
      account_file="$2"
      shift; shift 
    ;;
    -c|--config)
      config_file="$2"
      shift; shift 
    ;;
    *)
      echo "Unknown option: $1"; exit 1;
    ;;
esac
done

if [ -z "$account_file" -a -z "$config_file" ]; then 
  echo "You must supply either an account or configuration file."
  usage;
fi
if [ ! -z "$account_file" ]; then
  hop=$(cat "$account_file" |\
      sed 's/^ *account=//' |\
      sed 's/ *\([a-zA-Z0-9_-]\{1,\}\): */"\1": /g')
  if !(echo $hop | grep -q '"curator" *:'); then
      hop=$(echo $hop | sed "s/{/{\"curator\": \"$default_curator\", /")
  fi
  config="hops=[$hop]"
else
  config=$(cat $config_file)
fi

echo $config


