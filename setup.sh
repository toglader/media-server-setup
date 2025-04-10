#!/bin/bash

ENV_FILE="./media-server.env"

if [ "$EUID" -ne 0 ]; then
  echo "❌ This script must be run as root (use sudo)."
  exit 1
fi

if [ ! -f "$ENV_FILE" ]; then
  echo "❌ Environment file '$ENV_FILE' not found."
  exit 1
fi

export $(grep -v '^#' "$ENV_FILE" | xargs)

check_port() {
  if ss -tuln | grep -q ":$1\b"; then
    echo "❌ Port $1 is already in use."
    exit 1
  fi
}

check_ports() {
  echo "🔍 Checking port availability..."
  PORTS=(
    $PORT_PLEX $PORT_SONARR $PORT_RADARR $PORT_BAZARR $PORT_SABNZBD
    $PLEX_UDP_DLNA_PORT $PLEX_UDP_BONJOUR_PORT $PLEX_TCP_ROKU_PORT
    $PLEX_UDP_GDM_PORT1 $PLEX_UDP_GDM_PORT2 $PLEX_UDP_GDM_PORT3 $PLEX_UDP_GDM_PORT4
    $PLEX_TCP_DLNA_PORT
  )

  for PORT in "${PORTS[@]}"; do
    check_port $PORT
  done
}

case "$1" in
  start)
    check_ports
    echo "🚀 Starting media server containers..."
    docker-compose up -d
    ;;
  stop)
    echo "🛑 Stopping media server containers..."
    docker-compose down
    ;;
  *)
    echo "Usage: $0 {start|stop}"
    exit 1
    ;;
esac

