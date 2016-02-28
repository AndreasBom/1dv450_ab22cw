###Följande controllers används för API'et   
app/controllers    
  * application_ controller.rb
  * creators_controller.rb    
  * events_controller.rb    
  * positions_controller.rb    
  * tag_controller.rb
  
Beskrivningar om hur api'et används baseras på att du använder Postman för att göra förfrågningarna.       

  
## Bas-Url    
För att nå api'et används en basurl. Denna nås genom:    
  `http://localhost:3000/api/v1`

## API nyckel
Vid varje anrop måste en API-nyckel skickas med. För att få en API-nyckel krävs det att man registrerar sin applikation. Detta kan göras här http://localhost:3000/   
För enkelhetens skull finns det en förgenererad API-nyckel som testaren (du) kan använda. Nyckeln är aaaaaa (6 st a).    
Nyckeln skickas med i http-protokollets header [X-Api-Key]. Om du använder Postman väljer du fliken 'Headers' och i den högra kolumnen (Headers) skriver du X-Api-Key och i den vänstra (Value) skriver du api-nyckeln, alltså aaaaaa     
   
 
## Autentisering    
 För att få skapa, ändra och radera events, tags och positions krävs autentiering. Detta görs med Basic HTTP Authentication. Ingen autentiering krävs för att skapa en creator (resursägare). Autentieringen skickas med i HTTP-protokollets headers.    
 I fliken Authorization (Postman) väljer du BasicAuth. Skriv in User och Password. (längre ner i dokumentationen finns beskrivning hur du skapar en creator, vilket är det som skrivs in som User)    
     
     
## Query string och HTTP Body    
En förfrågan kan innehålla ett json-objekt som skickas med i HTTP body. Vissa förfrågningar använder även en query string.    
    
    
##Länkar till samtliga REST anrop    
######Headers:     
X-Api-Key :  aaaaaa   
    
GET `localhost:3000/api/v1/app/index`    
    
    
##Skapa en resursägare (creator)   
POST `localhost:3000/api/v1/creators/create`    
    
######Headers:    
X-Api-Key :  aaaaaa    
    
######Body   
`{    
    "creatorname": "User1",    
    "password": "123456",    
    "password_confirmation": "123456",     
    "email": "email@email.com"    
}`    
    

##Visa en resursägare    
GET `localhost:3000/api/v1/creators/show/1`    
    
######Headers:    
X-Api-Key :  aaaaaa     
    
    
##Skapa ett event    
POST `localhost:3000/api/v1/events/create`    
     
######Headers:    
X-Api-Key   :   aaaaaa     
User    :    User1      
Password    :    123456    
     
######Body:     
`{
    "message": "This is the message",
    "name": "New Messate",
    "rating": 2,
    "tags":[{"name": "NewTag"},{"name": "NewTag1"},{"name": "NewTag2"}],
    "position": {"name", "larmgatan, Kalmar"}
}`
    
##Visa alla event    
GET `localhost:3000/api/v1/events/show/all`    
    
######Headers:    
X-Api-Key   :   aaaaaa    
     
     
##Visa ett specifikt event    
GET `localhost:3000/api/v1/events/show/1`     
    
######Headers:    
X-Api-Key   :   aaaaaa    
    

##Radera ett event   
DELETE `localhost:3000/api/v1/events/delete/1`     
    
######Headers:    
X-Api-Key   :   aaaaaa     
User    :    User1      
Password    :    123456    
    
    

##Sök efter ett specifikt event    
Sök efter ett event genom eventets 'namn' eller 'message'. I följande fall söks efter 'This'    
GET `localhost:3000/api/v1/events/show/all?search=This`     
    
######Headers:    
X-Api-Key   :   aaaaaa    
    
##Updatera ett event    
PUT `localhost:3000/api/v1/events/update/1`
     
######Headers:    
X-Api-Key   :   aaaaaa     
User    :    User1      
Password    :    123456    
    
######Body:    
`{ "message": "This is a updated message", "tags": [{"name": "This is a new Tag"}]}`
    
##Radera ett event    
DELETE `localhost:3000/api/v1/events/delete/1`
     
######Headers:    
X-Api-Key   :   aaaaaa     
User    :    User1      
Password    :    123456    
     
    
##Skapa en tag   
POST `localhost:3000/api/v1/tags/create`    
    
######Headers:    
X-Api-Key   :   aaaaaa     
User    :    User1      
Password    :    123456      
    
######Body:    
`{"name": "NewTag"}`    
    
    
##Visa alla taggar    
GET `localhost:3000/api/v1/tags/show/all`    
    
######Headers:    
X-Api-Key   :   aaaaaa    
    
    
##Visa en specifik tagg   
GET `localhost:3000/api/v1/tags/show/1`    
    
######Headers:    
X-Api-Key   :   aaaaaa 
    
    

##Skapa en position
POST `localhost:3000/api/v1/positions/create`     
    
######Headers:    
X-Api-Key   :   aaaaaa     
User    :    User1      
Password    :    123456    
    
######Body:
`{ "name": "Larmgatan, Kalmar"}`    
    
    
##Visa alla positioner    
    
GET `localhost:3000/api/v1/positions/show/all`    
    
######Headers:    
X-Api-Key   :   aaaaaa    
    
    
##Visa en specifik position    
GET `localhost:3000/api/v1/positions/show/1`    
    
######Headers:    
X-Api-Key   :   aaaaaa    
    
    
#Visa positioner i närheten    
Visa positioner i närheten av positionen som har id 1    
GET `localhost:3000/api/v1/positions/show/1/nearby`   
    
######Headers:    
X-Api-Key   :   aaaaaa






