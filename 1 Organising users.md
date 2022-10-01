01-10-2022

# 1.4 Labo-oefeningen - Pieter Dc

## Gebruikers en groepen aanmaken

### -1-

- Wat is het commando om de huidige directory op te vragen? In welke map bevind je jou nu?

        pwd
        /home/osboxes

- Wat is het UID van deze gebruiker, wat is de GID?

       gebruik sudo less /etc/passwd om de UID en GID te vinden
       (gebruik q om uit less te gaan)

       De user id van osboxes is 1000 (groen)
       en de group id is 1000(rood)

  ![image](https://user-images.githubusercontent.com/100133263/193402681-5350636c-1499-42b9-8fdb-13503ae314cc.png)

### -2-

- Maak een nieuwe gebruiker aan met de naam alice, zonder specifieke opties. Werk hiervoor met adduser

        sudo adduser alice

### -3-

- In welk bestand kan je de UID, gebruikersnaam, homedirectory, enz. van alle gebruikers terugvinden?

      in /etc/passwd

- In welk configuratiebestand kan je al de bestaande gebruikersgroepen nakijken, en ook de gebruikers die lid zijn van elke groep?

      /etc/group

- In welk configuratiebestand vind je de wachtwoorden van alle gebruikers?

        /etc/shadow

### -4-

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

### -5-

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
        sudo passwd daniel

        sudo useradd -m -g sporten -G zwemmen eva
        sudo passwd eva

        doe id naam (bv: id alice)
        om te checken of ze de juiste primary group hebben
        want met /etc/group zie je er ze niet inzitten

        of check het met sudo groups naam (bv: sudo groups alice)

        voor de primary group kan je ook naar /etc/passwd gaan kijken.

- Verwijder nu de groep alice en controleer.

        sudo delgroup alice
        sudo less /etc/group -> alice is inderdaad weg

- Gebruiker daniel gaat een tijdje niet meer sporten. Zorg er voor dat deze gebruiker tot nader order geen toegang meer kan hebben tot het systeem (zonder het wachtwoord of de gebruiker te verwijderen!).

        sudo passwd -l daniel
        of alternatief: sudo usermod -L daniel

- Hoe kan je controleren dat daniel inderdaad geen toegang meer heeft tot het systeem? In welk bestand kan dat en hoe zie je daar dan dat het account afgesloten is?

        sudo passwd -S daniel -> status zien van het account
        of gaan kijken in /etc/shadow Het uitroepteken(groen) betekent dat het account locked is.

  ![image](https://user-images.githubusercontent.com/100133263/193406789-4cb50829-69d4-4c1b-bac9-ac0f06d1260f.png)

- Gebruiker daniel komt terug naar de sportclub. Geef hem opnieuw toegang tot het systeem.

         sudo passwd -u daniel -> terug unlocken

- Gebruiker eva stopt helemaal met sporten. Verwijder deze gebruiker, maar doe dit zorgvuldig: zorg er in het bijzonder voor dat ook haar homedirectory verwijderd wordt.

        sudo userdel -r eva

- Log aan als de gebruiker carol

        su - carol

- Controleer of je in de “thuismap” bent van deze gebruiker. Maak onder deze map een bestand test aan door middel van het commando touch.

        pwd
        touch test

- Probeer nu als gebruiker carol je te verplaatsen naar de “thuismap” van alice.

        cd /home/alice

- Kan je de inhoud van de mappen binnen de thuismap van alice bekijken?

        ja

- Probeer nu als carol onder de “thuismap” van alice ook een bestand test te maken. Lukt dit? Kan je dit verklaren?

        touch test -> permission denied
        je behoort niet tot de group van alice dus heb je geen rechten om daar iets aan te maken.

### -6-

- Bekijk de eerste regels van het bestand /etc/shadow. Wat bemerk je bij de gebruiker root?

        sudo head /etc/shadow
        Root heeft een ! voor zich

- Log in als de root-gebruiker met het commando sudo -i (let op de spatie!)

       alternatief: sudo su -

- Wat is de home-directory van root?

        /root

- Wat is het UID van deze gebruiker, wat is de GID?

        head /etc/passwd
        de UID en GID is 0

- Stel, nog steeds ingelogd als root, een wachtwoord in voor root. Kies een uniek, nieuw wachtwoord! Merk je de verandering in /etc/shadow?

        passwd
        Ja de hash in /etc/shadow is anders

- Log in als de root-gebruiker met het commando su - (let op de spatie!).
  Log uit, en log opnieuw in met sudo su -. Wat wordt er anders?

          Bij de ene vraagt hij eerst het wachtwoord. Bij de andere niet als je recent al sudo hebt gebruikt.

# -7-

- Voeg jezelf (met je eigen gekozen loginnaam) toe aan de VM waarin we werken. Gebruik hiervoor useradd -m <jouw loginnaam>

        sudo useradd -m pieter
        sudo passwd pieter

- Bewerk /etc/passwd zodat je ook bash gebruikt als default shell.

        sudo nano /etc/passwd
        verander de /bin/sh naar /bin/bash
        en doe dan ctrl + s en ctrl + x
    ![image](https://user-images.githubusercontent.com/100133263/193408395-0b096a80-d865-493c-8c3d-9ecac7eb4d6f.png)
    ![image](https://user-images.githubusercontent.com/100133263/193408435-f01f9299-a4c4-4396-bea0-54736e2cdfbe.png)


