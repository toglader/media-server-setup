Setup Plex, radarr, sonarr and bazarr automatically in containers.
Plex UI can be found from http://localhost:32400/web

Usage:
Edit media-server.env
```
# chmod +x setup.sh
# sudo ./setup.sh start
```
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

6. Store API key from Settings->General
  
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
6. Store API key for later use from Settings->General
     
Configure bazarr
----------------

1. Open http://localhost:30083/
2. Configure Sonarr from Settings -> Sonarr
    * Enable
    * Address "sonarr"
    * Port 8989
    * Add Sonarr API key
3. Click Test, and Save from top of the page
4. Configure Radarr from Settings -> Radarr
    * Enable
    * Address "radarr"
    * Port 7878
    * Add Radarr API key
5. Click Test, and Save from top of the page
6. Choose languages for subtitles
    * Settings -> Languages -> Choose languages
    * Save from top of the page

Configure plex
---------------
1. Open http://localhost:30080/web/
2. Login with existing Plex account or create new
3. Give a name for your server, click next
4. Add Library, type Movie, click next
5. Browse to "movies" folder and add
6. Add Library, type TV Shows, click next
7. Browse to "tv" and add
8. Click next and done


Configure overseerr
-------------------
1. Open http://localhost:30085/
2. Login with existing Plex account 
3. Add plex server with address "plex" and port 32400, save changes
4. Enable "Movies" and "TV Shows" libraries
5. Clock start scan and click Continue
6. Add radarr server
    * Select default server
    * Set any server name
    * hostname "radarr"
    * Port 7878
    * API Key from radarr
7. Click Test
8. Choose quality profile as "Any"
9. Set root Folder to "/storage/movies"
10. Click "Add server"
11. Add Sonarr server
    * Select default server
    * Set any server name
    * Hostname "sonarr"
    * Port 8989
    * API key from sonarr 
12. Click test
13. Choose quality profile as "Any"
14. Select root folder to "/storage/tv"
15. Select language profile as "Deprecated"
16. Click "Add Server"
17. Click "Finish setup"


Enjoy
-----
Overseerr is available in http://localhost:30085/ and Plex in http://localhost:32400/web/
