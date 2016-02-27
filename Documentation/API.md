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
#####Headern (X-Api-Key :  aaaaaa).
GET `localhost:3000/api/v1/app/index`    
    
    
##Skapa en resursägare (creator)   
POST `localhost:3000/api/v1/creators/create`    
    
#####Headers:    
(X-Api-Key :  aaaaaa)    
    
#####Body   
`{
    "creatorname": "User1", 
    "password": "123456", 
    "password_confirmation": "123456", 
    "email": "email@email.com"
}`    

 

