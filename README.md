
# README - Configuration et lancement d'Olympus avec Ngrok

---
## ENGLISH

### Useful Links  
 
  https://ngrok.com/ 
  https://dashboard.ngrok.com/get-started/setup/windows - Ngrok Windows Setup:  
  https://nodejs.org/en/download

  https://github.com/Pax1601/DCSOlympus/releases/tag/v2.0.3
  https://github.com/ciribob/DCS-SimpleRadioStandalone/releases/tag/2.2.0.5
  
  https://www.digitalcombatsimulator.com/en/downloads/world/

---

### Where to find the Ws (Audio) Port?  
In your `olympus.json` file, look for the `"ws"` key under `"audio"` section. Change the `WSPort` value to the port you want to use. Example:  

```json
"audio": {
    "SRSPort": 5002,
    "WSPort": 4000,  -- change this port and remember to update proxy.js and ngrok.yml as well
    "WSEndpoint": "audio"
}
```

---

### How to configure Ngrok?  

1. Install Ngrok and run it in your command line (CMD).  
2. Add your authentication token:  
   ```bash
   ngrok config add-authtoken your-token
   ```  
3. Where to find your token?  
   Here: https://dashboard.ngrok.com/get-started/setup/windows  

4. Where is `ngrok.yml`?  
   Usually located at:  
   `C:\Users\YourUsername\AppData\Local\ngrok\ngrok.yml`

5. What to add to `ngrok.yml`?  

Add this **tunnels** section **After** the `version` and `agent` part after the `AuthToken`  

```yaml
version: "3"
agent:
  authtoken: your-token # authentication token do not touch if token already set
```
6. add the tunnel just after the authtoken:

```yaml
tunnels:
  web:
    addr: 3000        # frontend port (must match proxy.js)
    proto: http
    schemes:
      - https
    inspect: false
  api:
    addr: 4512        # backend port (must match proxy.js)
    proto: http
    schemes:
      - https
    inspect: false
  audio:
    addr: 4000        # Ws (Audio) port (must match proxy.js)
    proto: http
    schemes:
      - https
    inspect: false
```




---

### How to configure `proxy.js`?  

- Use the same frontend, backend, and Ws (Audio) ports as in `olympus.json` and `ngrok.yml`.

---

### How to launch Olympus with HTTPS?  

1. Start Olympus servers.  
2. **To run the proxy, open a command prompt (CMD) inside the source folder where `proxy.js` is located, then run:**  
   ```bash
   node proxy.js
   ```  
3. Run Ngrok with the command:  
   ```bash
   ngrok http 8080
   ```  
4. (Optional) Launch the Srs Server and connect to it from the Olympus menu using the audio button
---

### Important note  

Ngrok’s URL changes every time you restart it. To get the new URL, check the Ngrok Windows console. It looks like:  
`https://caec2ec43c75.ngrok-free.app/`

Check if Node.js is installed
Check if Ngrok is installed
Check if  the port is open on your firewall computer or server 
Check if the port forwarding is good on your router

If is dont work sends me a discord message to @teravoille


## FRANÇAIS

### Liens utiles  
https://ngrok.com/ 
  https://dashboard.ngrok.com/get-started/setup/windows - Installation et configuration Ngrok Windows :  
  https://nodejs.org/en/download

  https://github.com/Pax1601/DCSOlympus/releases/tag/v2.0.3

  https://github.com/ciribob/DCS-SimpleRadioStandalone/releases/tag/2.2.0.5
  https://www.digitalcombatsimulator.com/en/downloads/world/
  
---

### Où trouver le port Ws (Audio) ?  
Dans le fichier `olympus.json`, cherche la clé `"ws"` dans la section `"audio"`. Modifie la valeur `WSPort` au port que tu souhaites utiliser. Exemple :  

```json
"audio": {
    "SRSPort": 5002,
    "WSPort": 4000,  -- change ce port et pense à le modifier aussi dans proxy.js et ngrok.yml
    "WSEndpoint": "audio"
}
```

---

### Comment configurer Ngrok ?  

1. Installe Ngrok et lance-le en ligne de commande (CMD).  
2. Ajoute ton token d'authentification :  
   ```bash
   ngrok config add-authtoken your-token
   ```  
3. Où trouver ton token ?  
   Sur ce lien : https://dashboard.ngrok.com/get-started/setup/windows  

4. Où se trouve le fichier `ngrok.yml` ?  
   Sur Windows, il est généralement ici :  
   `C:\Users\YourUsername\AppData\Local\ngrok\ngrok.yml`

5. Que faut-il ajouter dans `ngrok.yml` ?  

Ajoute cette partie **tunnels** complète après la section `version` et `agent` juste aprés le `AuthToken`  
```yaml
version: "3"
agent:
  authtoken: your-token # token d'authentification ne pas toucher si token deja set 
```

6. ajouter le tunnel just aprés le authtoken :  

```yaml
tunnels:
  web:
    addr: 3000        # port frontend (doit correspondre à proxy.js)
    proto: http
    schemes:
      - https
    inspect: false
  api:
    addr: 4512        # port backend (doit correspondre à proxy.js)
    proto: http
    schemes:
      - https
    inspect: false
  audio:
    addr: 4000        # port Ws (Audio) (doit correspondre à proxy.js)
    proto: http
    schemes:
      - https
    inspect: false
```


---

### Comment configurer `proxy.js` ?  

- Mets les mêmes ports frontend, backend et Ws (Audio) que dans `olympus.json` et `ngrok.yml`.

---

### Comment lancer Olympus avec HTTPS ?  

1. Démarre le serveurs Olympus.  
2. **Pour lancer le proxy, ouvre une console (CMD) dans le dossier source où se trouve `proxy.js`, puis lance la commande :**  
   ```bash
   node proxy.js
   ```  
3. Lance Ngrok avec la commande :  
   ```bash
   ngrok http 8080
   ```  
4. (Facultative)Lancer le Serveur Srs et le connecter depuis le menu de Olympus grâce au bouton audio 
---

### Note importante  

L’URL générée par Ngrok change à chaque redémarrage. Pour récupérer le lien, regarde la console Windows de Ngrok, ce sera un lien du type :  
`https://caec2ec43c75.ngrok-free.app/`
 
 Vérifiez si Node.js est installé
 Vérifiez si Ngrok est installé
 Vérifiez si le port est ouvert sur votre pare-feu ou serveur
 Vérifiez si la redirection de port est correcte sur votre routeur

 Si cela ne fonctionne pas, envoyez-moi un message Discord à @teravoille






