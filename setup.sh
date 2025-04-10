#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "Error: This script must be run as root. Please use sudo."
  exit 1
fi

# Load environment variables from file
set -a
source media-server.env
set +a

# Function to check if a port is in use
check_port() {
  if netstat -tuln | grep ":$1" > /dev/null; then
    echo "Error: Port $1 is already in use."
    exit 1
  fi
}

# Function to start containers
start_containers() {
  # Check availability of the required ports
  check_port $PORT_PLEX
  check_port $PORT_SONARR
  check_port $PORT_RADARR
  check_port $PORT_BAZARR
  check_port $PLEX_UDP_DLNA_PORT  # Plex UDP for DLNA
  check_port $PLEX_UDP_BONJOUR_PORT  # Plex UDP for Bonjour/Avahi
  check_port $PLEX_TCP_ROKU_PORT  # Plex TCP for Roku control
  check_port $PLEX_UDP_GDM_PORT1  # Plex UDP for GDM
  check_port $PLEX_UDP_GDM_PORT2  # Plex UDP for GDM
  check_port $PLEX_UDP_GDM_PORT3  # Plex UDP for GDM
  check_port $PLEX_UDP_GDM_PORT4  # Plex UDP for GDM
  check_port $PLEX_TCP_DLNA_PORT  # Plex TCP for DLNA

  # Create needed folders
  mkdir -p "$BASE_DIR"/{plex/config,plex/transcode}
  mkdir -p "$BASE_DIR"/{sonarr/config,radarr/config,bazarr/config}
  mkdir -p "$BASE_DIR"/{media/{tv,movies},downloads}
  # Start the Docker containers
  docker-compose up -d
  echo "Plex UI is available in /web"
}

# Function to stop containers
stop_containers() {
  # Stop the Docker containers
  docker-compose down
}

# Main script logic to handle start/stop
case "$1" in
  start)
    echo "Starting the media stack..."
    start_containers
    ;;
  stop)
    echo "Stopping the media stack..."
    stop_containers
    ;;
  *)
    echo "Usage: $0 {start|stop}"
    exit 1
    ;;
esac

