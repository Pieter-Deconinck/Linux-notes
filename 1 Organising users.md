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

- Wat zal het GID zijn van de groepen zwemmen en judo als je deze nu onmiddellijk zou aanmaken? Maak ze aan en controleer!

        1003 en 1004
        sudo addgroup zwemmen
        sudo addgroup judo

- Voeg de gebruiker alice toe aan de groepen sporten en zwemmen

        sudo adduser alice sporten
        sudo adduser alice zwemmen

- Log in als alice door in een terminal het commando su - alice (let op de spaties!) uit te voeren En zorg er nu voor dat de groep sporten de primaire groep wordt van alice.

        Alice heeft geen sudo toegang dus kan haar primary group niet aanpassen.
        om haar sudo access te geven: sudo usermod -aG sudo alice

        sudo usermod -g sporten alice

- Zorg er voor dat alice uitgelogd is, ga terug naar root

        exit

- Maak nu de gebruikers in onderstaande tabel aan. Zorg er voor dat ze al meteen bij aanmaken tot de aangegeven groepen behoren. Kies zelf geschikte wachtwoorden voor deze gebruikers en vergeet ze niet (vul eventueel een kolom toe aan de tabel).

| Gebruikersnaam | Primaire groep | secundaire group |
| -------------- | -------------- | ---------------- |
| bob            | sporten        | judo             |
| carol          | sporten        | zwemmen          |
| daniel         | sporten        | judo             |
| eva            | sporten        | zwemmen          |

        sudo useradd -m -g sporten -G judo bob
        sudo passwd bob

        sudo useradd -m -g sporten -G zwemmen carol
        sudo passwd carol

        sudo useradd -m -g sporten -G judo daniel
        udo passwd daniel

        sudo useradd -m -g sporten -G zwemmen eva
        sudo passwd eva
