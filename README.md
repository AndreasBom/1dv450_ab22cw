# 1dv450_ab22cw
Beskrivningen för uppgift 1 och 2.  

Repo till kursen Webbramverk    

###Uppgift 1
Jag har utvecklat och testat på Ubuntu som körts i VirtualBox. Jag har inte fått det att fungera på Windows 10. Om du inte får det att funka lokalt går det att köra på cloud9.


####Lokal Installation
Kör i kommandotolken:   

     git clone https://github.com/AndreasBom/1dv450_ab22cw.git
     cd 1dv450
     cd project
     bundle install
     rake db:reset
     
     kör igång servern:   
     rails s   
     

####Installation på cloud9    

     Skapa en konto på https://c9.io/ eller logga in med ett ditt befintliga github-konto
     Välj 'create a New Workspace'
     Fyll i workspace name till något valfritt
     I 'Clone from Git or Mercurial URL' klistrar du in https://github.com/AndreasBom/webbramverk_deployed
     Tryck 'Create Workspace'
     
     skriv följande i terminalfönstret i cloud9:
     cd project
     bundle update
     rake db:reset
     
     För att köra igång servern skrivs:
     rails s -p $PORT -b $IP
     
     
###Uppgift 2   
#####Installation
* Ladda ner repot (exempelvis med git clone https://github.com/AndreasBom/1dv450_ab22cw.git)    
* Använd en kommandotolk som har ssh ex. git bash, Cygwin etc.
I kommandotolken, skriv:   
* cd 1dv450   
* cd project    
    
kör följande kommandon för att installera en vagrantmaskin, (kör ett kommando i taget. Om det inte funkar kan du testa att först köra kommandot | vagrant provision |)):
* vagrant up
* vagrant ssh 
* cd /vagrant
* cd project   
   
Nu bör du vara inne i katalogen där appen ligger.    
Skriv:    
* bundle install    
* rake db:setup
   
Kör igång servern genom att skriva:    
* rails s -b 0.0.0.0     
    
Dokumentation hittas i katalogen Dokummentation





     
     
     
     



    
