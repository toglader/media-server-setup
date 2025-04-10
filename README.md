Setup Plex, radarr, sonarr and bazarr automatically in containers.
Plex UI can be found from http://localhost:32400/web

Usage:
Edit media-server.env
# chmod +x setup.sh
# sudo ./setup.sh start

Configure sabnzbd
-----------------
1. Open http://localhost:30084/
2. Add your news provider
3. Copy API key from "General" tab
4. Configure username and password
5. Go to "Category" and click "save" on "tv" category


Configure sonarr
----------------

1. Open http://localhost:30081/
2. Setup authentication:
   * Method: Forms
   * Authentication required: Enabled
   * Set username & password
   * Save
3. Open Settings, Media management
   * Add root folder: /storage/tv
4. Setup download client
   * Click "plus"
   * Add sabnzbd
   * Hostname sabnzbd and port 8080
   * Fill APIkey, username and password from sabnzbd
   * Test and save
5. Setup indexer
   * Click "plus"
   * Choose from newznab presets your indexer and configure
  
Configure radarr
----------------

1. Open http://localhost:30082/
2. Setup authentication:
   * Method: Forms
   * Authentication required: Enabled
   * Set username & password
   * Save
3. Open Settings, Media management
   * Add root folder: /storage/movies
4. Setup download client
   * Click "plus"
   * Add sabnzbd
   * Hostname sabnzbd and port 8080
   * Fill APIkey, username and password from sabnzbd
   * Test and save
5. Setup indexer
   * Click "plus"
   * Choose from newznab presets your indexer and configure
     
Configure bazarr
----------------

1. Open http://localhost:30083/
2. TODO...

Configure plex
---------------
1. Open http://localhost:32400/
2. Login with existing credentials
3. TODO...

