01-10-2022

# 1.4 Labo-oefeningen - Pieter Dc

## Gebruikers en groepen aanmaken

- Wat is het commando om de huidige directory op te vragen? In welke map bevind je jou nu?

        pwd
        /home/osboxes

- Wat is het UID van deze gebruiker, wat is de GID?

       gebruik sudo less /etc/passwd om de UID en GID te vinden
       (gebruik q om uit less te gaan)

       De user id van osboxes is 1000 (groen)
       en de group id is 1000(rood)

  ![image](https://user-images.githubusercontent.com/100133263/193402681-5350636c-1499-42b9-8fdb-13503ae314cc.png)

- Maak een nieuwe gebruiker aan met de naam alice, zonder specifieke opties. Werk hiervoor met adduser

        sudo adduser alice

- In welk bestand kan je de UID, gebruikersnaam, homedirectory, enz. van alle gebruikers terugvinden?

      in /etc/passwd

- In welk configuratiebestand kan je al de bestaande gebruikersgroepen nakijken, en ook de gebruikers die lid zijn van elke groep?

      /etc/group

- In welk configuratiebestand vind je de wachtwoorden van alle gebruikers?

        /etc/shadow

- Maak een groep aan met de naam: sporten

        sudo addgroup sporten

- In welk configuratiebestand vind je het GID van deze groep terug?

        /etc/group
     ![image](https://user-images.githubusercontent.com/100133263/193402964-8ca2b997-fbcb-404c-87ed-51af9eeafb7c.png)

